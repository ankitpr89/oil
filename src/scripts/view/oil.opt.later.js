export default function() {
    return `
        <div class="oil-minified">
            <div class="oil-content-overlay">
                <div class="oil-l-container">
                    <h1 class="oil__heading-mini">
                        Um unsere Dienste für Sie noch besser zu machen, brauchen wir ihr Einverständnis.
                    </h1>
                    <p class="oil__intro-text-mini">
                        Sie müssen zustimmen, wenn wir ihre Daten erheben und weiter verarbeiteten wollen. 
                        <a href="#" class="oil__intro-text--secondary-mini">Mehr erfahren</a>
                    </p>
                </div>
                <div class="oil-l-container">
                    <div class="oil-btn-group-mini">
                        <button class="oil__btn-mini oil__btn-mini--1st js-optin-poi" data-qa="oil-small-poi-YesButton">
                            Global zustimmen
                        </button>
                        <div class="oil__btn-mini-label">
                            Für alle Axel Springer Dienste
                        </div>
                    </div>
                    <div class="oil-btn-group-mini">
                        <button class="oil__btn-mini oil__btn-mini--2nd js-optin" data-qa="oil-small-YesButton">
                            Jetzt zustimmen
                        </button>
                        <div class="oil__btn-mini-label">
                            Nur für diese Seite
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}