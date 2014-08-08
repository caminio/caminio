App.CaminioModalComponent = Ember.Component.extend
  translatedTitle: (->
    return Em.I18n.t(@.get('title'))
  ).property('title')
  show: (->
    @.$('.modal').modal().on('hidden.bs.modal', (->
      @.sendAction('close')
    ).bind(@))
    if @get('width')
      @.$('.modal-dialog').css('width', @get('width'))
  ).on('didInsertElement')
