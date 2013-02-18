App.Renderer =
  BOX_HTML: '<span><%= title %> (<%= category %>)</span><hr /><img src="<%= image_src %>">'

  renderBoxes: ($container, data) ->
    return unless $container.length
    return unless data.length > 0
    $container.html('')
    boxes = []

    boxes.push(@renderBox(datum)) for datum in data
    $container.append(boxes)
    @_masonify($container)

  renderBox: (datum) ->
    $('<div/>',
      'class': 'search-result',
      html: _.template(@BOX_HTML, { title: datum.name, category: datum.notable?.name, image_src: App.Freebase.BASE_IMAGE_URL + datum.id }),
      id: datum.id?.replace(/[/]/g, '_')
    )

  renderExtraInformation: ($box, description) ->
    return unless $box.length
    return unless description.length
    $paragraph = $('<p/>', html: description)

    $box.append($paragraph)

  _masonify: ($container) ->
    $container.imagesLoaded ->
      $container.masonry
      itemSelector: '.search-result'
      columnWidth: 100
