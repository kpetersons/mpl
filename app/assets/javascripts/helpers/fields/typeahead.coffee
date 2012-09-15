Mpl.TypeaheadField = Ember.TextField.extend(
  didInsertElement: ->
    console.log 'TypeaheadField sources', @get('sources')
    @$().typeahead(
      source: @get('sources')
    )
)