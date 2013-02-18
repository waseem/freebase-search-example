window.App =
  TIMER: null
  LAST_QUERY_STRING: ''

  init: ->
    @watchUserInput()

  watchUserInput: ->
    $('#search').keyup($.proxy(@, '_delayedSearch'))

  search: (query_string) ->
    return unless query_string.length
    return if query_string == @LAST_QUERY_STRING
    @LAST_QUERY_STRING = query_string

    @Freebase.search(query_string,
      $.proxy(@, '_handleSearchSuccessState'),
      $.proxy(@, '_handleSearchFailureState')
    )

  _handleSearchSuccessState: (data) ->
    @Renderer.renderBoxes($('#search-results'), data.result)
    @Freebase.fetchExtraInformation(data.result,
      $.proxy(@, '_handleFetchExtraInformationSuccessState'),
      $.proxy(@, '_handleFetchExtraInformationFailureState')
    )

  _handleSearchFailureState: ->
    console.log('Fffffuuuu')

  _handleFetchExtraInformationSuccessState: (id, description) ->
    @Renderer.renderExtraInformation($('div#' + id), description)

  _handleFetchExtraInformationFailureState: ->
    console.log('Bbbboooooo')

  _delayedSearch:(e) ->
    clearTimeout(@TIMER)
    # Proxy is used because of issue with setTimeout
    # See 'The "this" problem' at https://developer.mozilla.org/en/docs/DOM/window.setTimeout
    @TIMER = setTimeout($.proxy(@, 'search'), 400, e.currentTarget.value)


$ ->
  App.init()
