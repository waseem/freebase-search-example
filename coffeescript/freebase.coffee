App.Freebase =
  BASE_IMAGE_URL: 'https://usercontent.googleapis.com/freebase/v1/image'

  search: (query_string, _done, _fail) ->
    $.get('https://www.googleapis.com/freebase/v1/search', { query: query_string, lang: 'en' }).
      done(_done).fail(_fail)

  fetchExtraInformation: (data, _done, _fail) ->
    @_fetchExtraInformationForNode(datum.id, _done, _fail) for datum in data when datum.id?

  _fetchExtraInformationForNode: (id, _done, _fail) ->
    _id = id.replace(/[/]/g, '_')
    $.get('https://www.googleapis.com/freebase/v1/text' + id, (result) -> _done(_id, result.result))
