Mpl.LanguagesIndexController = Mpl.EditRecordController.extend(
  modelType: Mpl.Setting

  persistRecordInstance: ->
    record = @record()
    if record && record.isValid()
      record.save()
      return true
    return false

  releaseRecordInstance: ->
    true
)