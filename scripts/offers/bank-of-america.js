// Initialize row headers
window.rows = [];

// Helper functions
const getTarget = (container, selector, attribute) => {
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

const offerItems = Array.from(document.querySelectorAll('.deal-tile'));

window.rows.push(
    ...offerItems
        .map((offerItem) => {
            let offerName = getTarget(offerItem, '.deal-logo > img', 'alt');
            offerName = offerName ? offerName.replace(' Logo', '') : '';

            let expiryText = getTarget(offerItem, '[class^=deal-exp]', 'innerText');
            expiryText = expiryText.replace('Exp. ', '');

            return {
                card: 'Bank of America Cash Rewards',
                name: offerName,
                offer: getTarget(offerItem, '[class^=deal-offer]', 'innerText'),
                expiry: expiryText,
            };
        })
        .map(data => [
            data.card,
            data.name,
            data.offer,
            data.expiry,
            '',
        ].join('\t'))
);

window.rows = window.rows.join('\n');
