
// RELEVANT TESTING
describe('relevant', function() {

    beforeEach(function () {
        // reset state, local storage, clear cookies
    })

    // page title
    it('should have correct <title>', function() {
        cy.visit('http://localhost:3000')
        // subject        chaining      value
        cy.title().should('include', 'Relevant')
    })

    // navigation elements
    it('should contain nav elements', function() {
        // first (chaining)
        cy.get('#navbar').find('ul').children('li')
            .find('a').first().should('contain', 'My News')

        // second
        cy.get('#navbar').contains('Manage Sources')
    })

    // signup, login
    // it('should prompt for login', function () {})

}) // end testing
