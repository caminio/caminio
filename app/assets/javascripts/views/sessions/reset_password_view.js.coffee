App.SessionsResetPasswordView = Ember.View.extend
  layoutName: 'sessions/layout'
  didInsertElement: ->
    @.$('input[type=text]:first').focus()
