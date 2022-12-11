// Initialize row headers
window.rows = [];

// Helper functions
var getTarget = (container, selector, attribute) => {
    const target = container.querySelector(selector);

    if (attribute) {
        return target ? target[attribute] : null;
    }

    return target;
};
Date.prototype.addDays = function(days) {
    const date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}

var offerItems = Array.from(document.querySelectorAll('.item'));

var parseOffer = container => {
    const offerText = getTarget(container, `a[role='button'] > div`, 'innerText');
    if (!offerText) {
        return '';
    }

    let [, offer = offerText] = offerText.match(/Get (.+) back/) || [];
    if (offer.includes('up to')) {
        let [, upToOffer = offerText] = offer.match(/up to (.+)/) || [];
        return upToOffer;
    }

    return offer;
};

window.rows.push(
    ...offerItems
        .map((offerItem) => ({
            card: 'Capital One Savor One',
            name: getTarget(offerItem, '.merchantCleanName', 'innerText'),
            offer: parseOffer(offerItem),
            expiry: getTarget(offerItem, ':scope div > div > div', 'innerText'),
        }))
        .map(data => [
            data.card,
            data.name,
            data.offer,
            data.expiry,
            '',
        ].join('\t'))
);

window.rows.join('\n');
