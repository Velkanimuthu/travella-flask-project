/* ════════════════════════════════════════════════
   TRAVELLA — Main JavaScript
════════════════════════════════════════════════ */

// ─── LOADING SPINNER ──────────────────────────
window.addEventListener('load', () => {
  const overlay = document.querySelector('.spinner-overlay');
  if (overlay) {
    setTimeout(() => overlay.classList.add('hidden'), 400);
    setTimeout(() => overlay.remove(), 1000);
  }
});

// ─── NAVBAR SCROLL EFFECT ─────────────────────
const navbar = document.querySelector('.navbar');
if (navbar) {
  const handleScroll = () => {
    navbar.classList.toggle('scrolled', window.scrollY > 50);
  };
  window.addEventListener('scroll', handleScroll, { passive: true });
  handleScroll();
}

// ─── INTERSECTION OBSERVER — REVEAL ──────────
const revealEls = document.querySelectorAll('.reveal');
if (revealEls.length) {
  const obs = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('visible');
        obs.unobserve(e.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });
  revealEls.forEach(el => obs.observe(el));
}

// ─── FLASH MESSAGE AUTO-DISMISS ───────────────
document.querySelectorAll('.flash-msg').forEach(msg => {
  setTimeout(() => {
    msg.style.transition = 'opacity 0.5s, transform 0.5s';
    msg.style.opacity = '0';
    msg.style.transform = 'translateX(40px)';
    setTimeout(() => msg.remove(), 500);
  }, 4000);

  const closeBtn = msg.querySelector('.flash-close');
  if (closeBtn) {
    closeBtn.addEventListener('click', () => {
      msg.style.opacity = '0';
      setTimeout(() => msg.remove(), 300);
    });
  }
});

// ─── BOOTSTRAP TOOLTIP INIT ───────────────────
document.addEventListener('DOMContentLoaded', () => {
  const tooltipEls = document.querySelectorAll('[data-bs-toggle="tooltip"]');
  tooltipEls.forEach(el => new bootstrap.Tooltip(el, { trigger: 'hover' }));
});

// ─── FILTER BUTTONS ───────────────────────────
function initFilters(btnSelector, cardSelector, attr) {
  const buttons = document.querySelectorAll(btnSelector);
  const cards   = document.querySelectorAll(cardSelector);
  if (!buttons.length) return;

  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      buttons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const val = btn.dataset[attr] || '';
      cards.forEach(card => {
        const match = !val || card.dataset[attr] === val;
        card.closest('.col-reveal') 
          ? (card.closest('.col-reveal').style.display = match ? '' : 'none')
          : (card.style.display = match ? '' : 'none');
      });
    });
  });
}

initFilters('[data-filter-category]', '[data-category]', 'category');
initFilters('[data-filter-cuisine]',  '[data-cuisine]',  'cuisine');

// ─── VEHICLE CARD SELECTION ───────────────────
const vehicleCards = document.querySelectorAll('.vehicle-card');
const vehicleInput = document.getElementById('vehicleTypeInput');

vehicleCards.forEach(card => {
  card.addEventListener('click', () => {
    vehicleCards.forEach(c => c.classList.remove('selected'));
    card.classList.add('selected');
    if (vehicleInput) vehicleInput.value = card.dataset.type;
  });
});

// ─── TRANSLATOR ENGINE ────────────────────────
// Supports unlimited text with chunk splitting + 3 API fallbacks

const translateBtn = document.getElementById('translateBtn');
if (translateBtn) {
  translateBtn.addEventListener('click', () => runTranslation());
}

async function runTranslation() {
  const srcText    = document.getElementById('sourceText').value.trim();
  const targetLang = document.getElementById('targetLang').value;
  const sourceLang = document.getElementById('sourceLang') ? document.getElementById('sourceLang').value : 'en';
  const outBox     = document.getElementById('outputText');
  const outWrap    = document.getElementById('translationOutput');
  const loadEl     = document.getElementById('translateLoading');
  const btn        = document.getElementById('translateBtn');
  const charCount  = document.getElementById('charCount');

  if (!srcText) { showTranslateError('Please enter some text to translate.'); return; }

  if (loadEl) { loadEl.style.display = 'block'; loadEl.innerHTML = '<div class="d-flex align-items-center gap-2"><span class="spinner-border spinner-border-sm"></span> Translating...</div>'; }
  if (outWrap) outWrap.style.display = 'none';
  btn.disabled = true;
  btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Translating…';

  try {
    const result = await translateAny(srcText, sourceLang, targetLang);
    if (outBox)  outBox.textContent = result;
    if (outWrap) outWrap.style.display = 'block';
    if (loadEl)  loadEl.style.display = 'none';
    if (charCount) charCount.textContent = result.length + ' characters';
  } catch(e) {
    showTranslateError('Translation failed: ' + e.message + '. Please try again.');
  } finally {
    btn.disabled = false;
    btn.innerHTML = '<span>🌐</span> Translate';
    if (loadEl) loadEl.style.display = 'none';
  }
}

// ── MAIN TRANSLATE FUNCTION ──────────────────
// Splits long text into chunks, translates each, rejoins
async function translateAny(text, srcLang, tgtLang) {
  // Split into sentences/chunks of max 400 chars to avoid API limits
  const chunks = splitIntoChunks(text, 400);
  const results = [];

  for (let i = 0; i < chunks.length; i++) {
    const chunk = chunks[i].trim();
    if (!chunk) { results.push(''); continue; }

    // Update loading message for multi-chunk
    const loadEl = document.getElementById('translateLoading');
    if (loadEl && chunks.length > 1) {
      loadEl.innerHTML = '<div class="d-flex align-items-center gap-2"><span class="spinner-border spinner-border-sm"></span> Translating part ' + (i+1) + ' of ' + chunks.length + '...</div>';
    }

    // Try API 1: MyMemory
    let translated = await tryMyMemory(chunk, srcLang, tgtLang);

    // Try API 2: LibreTranslate (fallback)
    if (!translated) translated = await tryLibreTranslate(chunk, srcLang, tgtLang);

    // Try API 3: Lingva (fallback)
    if (!translated) translated = await tryLingva(chunk, srcLang, tgtLang);

    // If all fail, keep original
    if (!translated) translated = chunk;

    results.push(translated);

    // Small delay between chunks to be polite to APIs
    if (i < chunks.length - 1) await sleep(300);
  }

  return results.join(' ');
}

// ── API 1: MyMemory ──────────────────────────
async function tryMyMemory(text, srcLang, tgtLang) {
  try {
    const url = 'https://api.mymemory.translated.net/get?q=' +
                encodeURIComponent(text) +
                '&langpair=' + srcLang + '|' + tgtLang +
                '&de=travella@travel.com';
    const res  = await fetch(url, { signal: AbortSignal.timeout(8000) });
    const data = await res.json();
    if (data.responseStatus === 200 && data.responseData.translatedText) {
      const t = data.responseData.translatedText;
      // MyMemory sometimes returns error messages as translations
      if (t.includes('MYMEMORY WARNING') || t.includes('QUERY LENGTH LIMIT')) return null;
      return t;
    }
    return null;
  } catch { return null; }
}

// ── API 2: LibreTranslate (multiple mirrors) ─
async function tryLibreTranslate(text, srcLang, tgtLang) {
  const mirrors = [
    'https://libretranslate.com/translate',
    'https://translate.argosopentech.com/translate',
    'https://translate.terraprint.co/translate',
  ];
  for (const url of mirrors) {
    try {
      const res = await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ q: text, source: srcLang, target: tgtLang, format: 'text' }),
        signal: AbortSignal.timeout(6000)
      });
      const data = await res.json();
      if (data.translatedText) return data.translatedText;
    } catch { continue; }
  }
  return null;
}

// ── API 3: Lingva Translate ──────────────────
async function tryLingva(text, srcLang, tgtLang) {
  try {
    const url = 'https://lingva.ml/api/v1/' + srcLang + '/' + tgtLang + '/' + encodeURIComponent(text);
    const res  = await fetch(url, { signal: AbortSignal.timeout(6000) });
    const data = await res.json();
    if (data.translation) return data.translation;
    return null;
  } catch { return null; }
}

// ── CHUNK SPLITTER ───────────────────────────
// Splits text by sentences first, then by words if needed
function splitIntoChunks(text, maxLen) {
  if (text.length <= maxLen) return [text];

  const chunks = [];
  // Split by sentence endings
  const sentences = text.match(/[^.!?\n]+[.!?\n]*/g) || [text];
  let current = '';

  for (const sentence of sentences) {
    if ((current + sentence).length <= maxLen) {
      current += sentence;
    } else {
      if (current.trim()) chunks.push(current.trim());
      // If single sentence is too long, split by words
      if (sentence.length > maxLen) {
        const words = sentence.split(' ');
        current = '';
        for (const word of words) {
          if ((current + ' ' + word).length <= maxLen) {
            current += (current ? ' ' : '') + word;
          } else {
            if (current.trim()) chunks.push(current.trim());
            current = word;
          }
        }
      } else {
        current = sentence;
      }
    }
  }
  if (current.trim()) chunks.push(current.trim());
  return chunks.filter(c => c.length > 0);
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

function showTranslateError(msg) {
  const loadEl = document.getElementById('translateLoading');
  if (loadEl) { loadEl.style.display = 'block'; loadEl.innerHTML = '<span class="text-danger">⚠️ ' + msg + '</span>'; }
}

// ─── COPY TRANSLATION ─────────────────────────
const copyBtn = document.getElementById('copyTranslation');
if (copyBtn) {
  copyBtn.addEventListener('click', () => {
    const text = document.getElementById('outputText')?.textContent;
    if (text) {
      navigator.clipboard.writeText(text).then(() => {
        copyBtn.innerHTML = '✅ Copied!';
        setTimeout(() => copyBtn.innerHTML = '📋 Copy', 1800);
      });
    }
  });
}

// ─── ROUTE MAP ────────────────────────────────
const getDirectionsBtn = document.getElementById('getDirections');
if (getDirectionsBtn) {
  getDirectionsBtn.addEventListener('click', () => {
    const from = document.getElementById('fromLocation')?.value.trim();
    const to   = document.getElementById('toLocation')?.value.trim();
    if (!from || !to) {
      alert('Please enter both From and To locations.');
      return;
    }
    const mapFrame = document.getElementById('mapFrame');
    if (mapFrame) {
      const q = encodeURIComponent(`from: ${from} to: ${to}`);
      mapFrame.src = `https://maps.google.com/maps?q=${q}&output=embed`;
    }
  });
}

// ─── SOS BUTTON ───────────────────────────────
const sosBtn = document.getElementById('sosButton');
if (sosBtn) {
  sosBtn.addEventListener('click', () => {
    const confirmed = confirm('🆘 SOS ALERT\n\nThis will initiate an emergency call to Tourist Helpline (1800-111-363).\n\nPress OK to continue.');
    if (confirmed) {
      window.location.href = 'tel:1800111363';
    }
  });
}

// ─── HOTEL BOOKING MODAL POPULATE ─────────────
document.querySelectorAll('.book-hotel-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const hotelId   = btn.dataset.hotelId;
    const hotelName = btn.dataset.hotelName;
    const modal = document.getElementById('bookingModal');
    if (modal) {
      modal.querySelector('#modalHotelName').textContent = hotelName;
      modal.querySelector('#modalHotelId').value = hotelId;
    }
  });
});

// ─── ANIMATED COUNTER ─────────────────────────
function animateCounters() {
  document.querySelectorAll('.stat-number[data-target]').forEach(el => {
    const target = parseInt(el.dataset.target);
    const suffix = el.dataset.suffix || '';
    let current  = 0;
    const step   = Math.ceil(target / 60);
    const timer  = setInterval(() => {
      current += step;
      if (current >= target) { current = target; clearInterval(timer); }
      el.textContent = current + suffix;
    }, 20);
  });
}

const statsEl = document.querySelector('.stats-bar');
if (statsEl) {
  const statsObs = new IntersectionObserver((entries) => {
    if (entries[0].isIntersecting) {
      animateCounters();
      statsObs.disconnect();
    }
  }, { threshold: 0.5 });
  statsObs.observe(statsEl);
}

// ─── SAFETY PROGRESS BARS ANIMATE ─────────────
const progressObs = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      const bar = entry.target;
      const width = bar.dataset.width;
      setTimeout(() => bar.style.width = width + '%', 200);
      progressObs.unobserve(bar);
    }
  });
}, { threshold: 0.3 });

document.querySelectorAll('.safety-progress-bar[data-width]').forEach(bar => {
  bar.style.width = '0%';
  progressObs.observe(bar);
});
