
// RELEVANT TESTING
Cypress.config('baseUrl', 'http://localhost:3000')


describe('initial page load', function() {
    beforeEach(function () {
        // reset state, local storage, clear cookies
    })

    it('should have correct title', function() {
        cy.visit('http://localhost:3000')
        cy.title().should('include', 'Relevant')
    })

    it('should contain "My News" link', function() {
        // first element (chaining)
        cy.get('#navbar').find('ul').children('li')
            .find('a').first().should('contain', 'My News')
    })

    it('should contain "Manage Sources" link', function() {
        // second element (should v. contains)
        cy.get('#navbar').contains('Manage Sources')
    })

    it('should have four links in navbar pre-user', function() {
        cy.get('li').should("have.length", 4)
    })

    it(' /news should redirect to sign in URL', function() {
        // redirect
        cy.visit('/')
            .url().should('include', '/users/sign_in')
    })

    it('/sources should redirect to sign in URL', function() {
        // redirect (second way)
        cy.request({
            url: '/source/show',
            followRedirect: false
        }).then(function(res) {
            expect(res.status).to.eq(302)
            expect(res.redirectedToUrl).to.eq('http://localhost:3000/users/sign_in')
        })
    })

    it('should prompt user to sign up or log in', function() {
        cy.get('.navbar-text').should('contain', 'You need to sign in or sign up before continuing.')
    })
})


describe('login functionality', function() {
    it('should fail login with invalid user', function() {
        cy.get("form").within(function(){
            cy
                .get("input[name='user[email]']").type('fail@cypress.com')
                .get("input[name='user[password]']").type('test123')
                .root().submit()
            cy
                .url().should('include', '/users/sign_in')
        })
            cy.get('.navbar-text').should('contain', 'Invalid Email or password.')
    })

    beforeEach(function() {
        cy.visit('/users/sign_in')
    })
    it('should login with known user successfully', function() {
        cy.get("form").within(function(){
            cy
                .get("input[name='user[email]']").type('test@cypress.com')
                .get("input[name='user[password]']").type('test123')
                .root().submit()
        })
    })
})
