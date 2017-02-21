
// RELEVANT TESTING
Cypress.config('baseUrl', 'http://localhost:3000')

describe('initial page load', function() {
    beforeEach(function () {
        // reset state, local storage, clear cookies
    })

    it(' /news should redirect to sign in URL', function() {
        // redirect
        cy.visit('/')
            .url().should('include', '/users/sign_in')
    })

    it('/sources should redirect to sign in URL', function() {
        cy.request({
            url: '/source/show',
            followRedirect: false
        }).then(function(res) {
            expect(res.status).to.eq(302)
            expect(res.redirectedToUrl).to.eq('http://localhost:3000/users/sign_in')
        })
    })

    it('should have correct title', function() {
        cy.visit('http://localhost:3000')
        cy.title().should('include', 'Relevant')
    })

    it('should contain nav elements', function() {
        // first element (chaining)
        cy.get('#navbar').find('ul').children('li')
            .find('a').first().should('contain', 'My News')
        // second element
        cy.get('#navbar').contains('Manage Sources')
    })

    it('should show log in form', function() {})
})


