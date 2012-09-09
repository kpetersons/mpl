#= require_self
#= require_tree .
Mpl.NewRecordController = Ember.Controller.extend(

  options: -> Ember.K
#  {type: @get('type')}

  record: ->
    return @get('content')

  newRecordInstance: ->
    record = @record()
    unless record
      @set('content', @modelType.createRecord(@options()))
    return @record()

  persistRecordInstance: ->
    record = @record()
    if record && record.isValid()
      record.persist()
      @set('content', null)
      return true
    return false

  releaseRecordInstance: ->
    record = @record()
    if record
      record.deleteRecord()
    record.get("transaction").rollback()
    @set('content', null)
)

Mpl.EditRecordController = Mpl.NewRecordController.extend(

  newRecordInstance: ->
    record = @record()
    unless record
      @set('content', record)
    return record

  releaseRecordInstance: ->
    record = @record()
    record.get("transaction").rollback()
    @set('content', null)
)