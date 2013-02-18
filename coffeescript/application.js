// Generated by CoffeeScript 1.4.0
(function() {

  window.App = {
    TIMER: null,
    LAST_QUERY_STRING: '',
    init: function() {
      return this.watchUserInput();
    },
    watchUserInput: function() {
      return $('#search').keyup($.proxy(this, '_delayedSearch'));
    },
    search: function(query_string) {
      return this.Freebase.search(query_string, $.proxy(this, '_handleSearchSuccessState'), $.proxy(this, '_handleSearchFailureState'));
    },
    _handleSearchSuccessState: function(data) {
      this.Renderer.renderBoxes($('#search-results'), data.result);
      return this.Freebase.fetchExtraInformation(data.result, $.proxy(this, '_handleFetchExtraInformationSuccessState'), $.proxy(this, '_handleFetchExtraInformationFailureState'));
    },
    _handleSearchFailureState: function() {
      return console.log('Fffffuuuu');
    },
    _handleFetchExtraInformationSuccessState: function(id, description) {
      return this.Renderer.renderExtraInformation($('div#' + id), description);
    },
    _handleFetchExtraInformationFailureState: function() {
      return console.log('Bbbboooooo');
    },
    _delayedSearch: function(e) {
      clearTimeout(this.TIMER);
      return this.TIMER = setTimeout($.proxy(this, 'search'), 400, e.currentTarget.value);
    }
  };

  $(function() {
    return App.init();
  });

}).call(this);
