
describe('relevant', function () {

    beforeEach(function () {
        cy.visit('http://localhost:3000')
    })

    it('has valid title', function () {
        cy.get('.navbar-brand')
            .should('not.be.empty')
    })

        it('has navigation links', function () {
            cy.get('.navbar-nav')
                .find('li').first()
                .contains('My News')
        })
    })
})
