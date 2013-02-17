window.App =
  TIMER: null
  LAST_QUERY_STRING: ''

  init: ->
    @watchUserInput()

  watchUserInput: ->
    $('#search').keyup($.proxy(@, '_delayedSearch'))

  search: (query_string) ->
    @Freebase.search(query_string,
      $.proxy(@, '_handleSearchSuccessState'),
      $.proxy(@, '_handleSearchFailureState'),
      $.proxy(@, '_handleSearchCompletionState')
    )

  _handleSearchSuccessState: (data) ->
    @Renderer.renderBoxes($('#search-results'), data.result)
    @Freebase.fetchExtraInformation()

  _handleSearchFailureState: ->
    console.log('Fffffuuuu')

  _handleSearchCompletionState: ->

  _delayedSearch:(e) ->
    clearTimeout(@TIMER)
    # Proxy is used because of issue with setTimeout
    # See 'The "this" problem' at https://developer.mozilla.org/en/docs/DOM/window.setTimeout
    @TIMER = setTimeout($.proxy(@, 'search'), 400, e.currentTarget.value)


$ ->
  App.init()
