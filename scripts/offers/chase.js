// Initialize row headers
window.rows = [];

// Helper functions
var getTarget = (container, selector, attribute) => {
    var target = container.querySelector(selector);

    if (attribute) {
        return target ? target[attribute] : null;
    }

    return target;
};
Date.prototype.addDays = function(days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

var OFFER_SELECTOR = `[class$='one']`;
var EXPIRY_SELECTOR = `[class$='two']`;
var NAME_SELECTOR = `[class$='img-container'] > img`;
var STATUS_SELECTOR = `.iconAddToCard`;
var CARD_SELECTOR = `[name='accountSelector']`;

var getCardInfo = () => {
    const cardOptions = document.querySelector(CARD_SELECTOR).children;
    const [cardNode] = Array.from(cardOptions)
        .filter(option => option.selected);
    const [, numbers] = cardNode.label.match(/\(\.\.\.([^)]+)\)/)
    return `${cardNode.accessibleText} (${numbers})`;
}

var cardInfo = getCardInfo();
var offerItems = Array.from(document.querySelector('.offerList').children);

var parseOffer = container => {
    const offerText = getTarget(container, OFFER_SELECTOR, 'innerText');
    if (!offerText) {
        return '';
    }

    const [, offer = offerText] = offerText.match(/(.+) back/) || [];
    return offer;
}

var parseExpiry = container => {
    const expiryText = getTarget(container, EXPIRY_SELECTOR, 'innerText');
    const [, days = ''] = expiryText.match(/(.+) days left/) || [];

    if (isNaN(Number(days))) {
        return expiryText;
    }

    const expiryDate = new Date().addDays(Number(days));
    return expiryDate.toLocaleDateString('en-US')
};

window.rows.push(
    ...offerItems
        .map(offerItem => ({
            card: cardInfo,
            name: getTarget(offerItem, NAME_SELECTOR, 'alt'),
            offer: parseOffer(offerItem),
            expiry: parseExpiry(offerItem),
            added: !getTarget(offerItem, STATUS_SELECTOR),
        }))
        .map(data => [
            data.card,
            data.name,
            data.offer,
            data.expiry,
            data.added ? 1 : 0,
        ].join('\t'))
);

window.rows.join('\n');
