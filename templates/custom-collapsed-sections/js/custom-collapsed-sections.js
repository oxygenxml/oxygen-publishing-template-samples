const COLLAPSED_CLS = "collapsed";
addEventListener('DOMContentLoaded', (event) => {
    const toCollapseNodes = document.querySelectorAll(`.${COLLAPSED_CLS}`);
    toCollapseNodes.forEach((toCollapse) => {
        console.log(toCollapse);
        // Wait for the default expanded state to be initialized
        setTimeout(() => {collapse(toCollapse);},50);
    });
});

const collapse = (toCollapse) => {
    const expandBtn = toCollapse.querySelector('.wh_expand_btn');
    console.log('Expand button:', expandBtn);
    if (expandBtn) {
        // Change the Expand button's state
        expandBtn.classList.remove("expanded");
        expandBtn.ariaExpanded = "false";
        expandBtn.ariaLabel = "Expand";

        // The node that remains visible whne toggling between the expanded and collapsed state
        const titleNode = expandBtn.parentNode;
        
        // Hide title siblings
        Array.from(toCollapse.children)
            .filter(child => child != titleNode)
            .filter(child => !child.classList.contains('wh_not_expandable'))
            .forEach(child => {
                child.setAttribute('style', 'display:none');
            });
    }
    toCollapse.classList.remove(COLLAPSED_CLS);
};