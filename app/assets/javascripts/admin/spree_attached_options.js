//= require admin/spree_backend

$(function () {
  'use strict';

  var Select
    , Api
    , OptionType
    , OptionValue
    , $root = $('#new-attached-options')
    , fieldIndex = 0

  $('.attach-option-value').on('click', function (e) {
    $root.append(AttachedOptionValue.renderFields())
    e.preventDefault()
  })

  function AttachedOptionValue(index) {
    this.index = index
    this.initialize()
    this.bindEvents()
    this.loadOptionTypes()
  }

  AttachedOptionValue.renderFields = function () {
    var instance = new AttachedOptionValue(fieldIndex++)
    return instance.render()
  }

  AttachedOptionValue.prototype = {
    initialize: function () {
      this.$el = $('<div>', { 'class': 'feld row' })
      this.$options = $('<div>', { 'class': 'four columns alpha'})
      this.$values = $('<div>', { 'class': 'four columns' })
      this.$remove = $('<div>', { 'class': 'two columns omega' })
      this.$el.append(this.$options).append(this.$values).append(this.$remove)
    },

    bindEvents: function () {
      var self = this
      this.$options.on('change', function () {
        var optionId = $('select', this).val()
        self.loadOptionValues(optionId)
      })
    },

    loadOptionTypes: function () {
      OptionType.load().done($.proxy(function (data) {
          this.renderOptions(data)
          this.loadOptionValues(data[0].id)
        }, this) 
      )
    },

    loadOptionValues: function (id) {
      OptionValue
        .load({ id: id })
        .done($.proxy(function(data) {
            this.renderValues(data) 
          }, this))
    },

    render: function () {
      return this.$el
    },

    renderOptions: function (data) {
      var options = { items: data, label: 'Тип' }
      options['name'] = 'option_' + this.index
      this.$options.html(Select.render(options))
      this.select2(this.$options)
    },

    renderValues: function (data) {
      var options = { items: data, label: 'Значение' }
      options['name'] = 'master[attached_options_attributes][' + this.index + '][option_value_id]'
      this.$values.html(Select.render(options))
      this.select2(this.$values)
    },

    select2: function (el) {
      $('.select2', el).select2()
    }
  }

  Api = {
    cache: {},

    load: function (params) {
      var url = this.getUrl(params)
        , request = $.Deferred()
        , response = request.promise()

      this.loadFromCache(url, request)
      return response;
    },

    loadFromCache: function (url, request) {
      var data = this.cache[url]

      if (data) {
        request.resolve(data)
      } else {
        this.loadFromServer(url, request)
      }
    },

    loadFromServer: function (url, request) {
      $.getJSON(url, $.proxy(function (data) {
        this.cacheData(url, data)
        request.resolve(data)
      }, this))
    },

    cacheData: function (url, data) {
      this.cache[url] = data
    }
  }

  OptionType = _.extend({
      getUrl: function () {
        return '/api/option_types'
      }
  }, Api)
  
  OptionValue = _.extend({
      getUrl: function (params) {
        return '/api/option_types/' + params.id + '/option_values'
      }
  }, Api)

  Select = {
    render: function (options) {
      var html = this.html()
        , template = this.template(html)
      
      return template(options)
    },

    html: function () {
      this.htmlCache = this.htmlCache || [
        '<label for="<%= name %>"><%= label %></label>',
        '<select class="select2 fullwidth" name="<%= name %>" id="<%= name %>">',
          '<% _.each(items, function (item) { %>',
            '<option value="<%= item.id %>"><%= item.name %></option>',
          '<% }) %>',
        '</select>'
      ].join('\n')

      return this.htmlCache
    },

    template: function (html) {
      this.templateCache = this.templateCache || _.template(html)
      return this.templateCache
    }
  }
});
