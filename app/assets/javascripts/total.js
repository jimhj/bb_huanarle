var App = new Backbone.Marionette.Application();

App.addRegions({ 
  tableContainer: "#table_view",
  formContainer: "#form_view"
});

var Total = Backbone.Model.extend({
  attributes: {
    remarks: "没有写备注"
  }
});

var Totals = Backbone.Collection.extend({
  model: Total,
  url: '/totals'
});

var TotalView = Backbone.Marionette.ItemView.extend({
  template: "#total-template",
  tagName: 'tr',
  onRender: function () {
    $(this.el).find('td').attr('total_id', this.model.attributes.id);
  }
});


var TotalsView = Backbone.Marionette.CompositeView.extend({
  template: "#totals_list-template",
  tagName: "table",
  className: "table table-striped table-hover pull-left",
  itemView: TotalView,
  events: {
    'click td': 'showConsumptions'
  },

  onShow: function () {
    this.showLoadingBar();
  },

  appendHtml: function (collectionView, itemView) {
    $(itemView.el).find('td').css('cursor', 'pointer');
    collectionView.$("tbody").append(itemView.el); 
  },

  onRender: function (collectionView) {
    var self = this;
    setTimeout(function () { self.hideLoadingBar(); }, 100);    
  },

  showLoadingBar: function () {
    $('.loading-view').show();
  },

  hideLoadingBar: function () {
    $('.loading-view').hide();
  },

  showConsumptions: function (e) {
    var cons = new Consumptions();
    var total_id = $(e.target).attr('total_id');
    cons.url = "/totals/" + total_id; 
    cons.fetch();
    var consView = new ConsView({ collection: cons });
    App.tableContainer.close();
    App.tableContainer.show(consView);
  }

});


var Consumption = Backbone.Model.extend({});
var Consumptions = Backbone.Collection.extend({
  model: Consumption
});

var ConView = Backbone.Marionette.ItemView.extend({
  template: "#con-template",
  tagName: 'tr'
});

var ConsView = Backbone.Marionette.CompositeView.extend({
  template: "#cons_list-template",
  className: "cons_list_view",
  itemView: ConView,
  events: {
    'click button': 'backToTotal'
  },

  onShow: function () {
    $('.loading-view').show();
  },

  onRender: function () {
    $('.loading-view').hide();
  },

  appendHtml: function (collectionView, itemView) {
    collectionView.$("tbody").append(itemView.el); 
  },

  backToTotal: function () {
    App.tableContainer.close();
    var totals = new Totals();
    totals.fetch();
    var totalsView = new TotalsView({
      collection: totals
    });
    App.tableContainer.show(totalsView);
  } 

});

var NewConView = Backbone.Marionette.ItemView.extend({
  template: "#new_con-template"
});


App.addInitializer(function(options){
  var totalsView = new TotalsView({
    collection: options.totals
  });
  App.tableContainer.show(totalsView);
});



$(document).ready(function () {
  var totals = new Totals();  
  totals.fetch();
  App.start({ totals: totals });

  $('button').click(function () {
    // $('#myModal').modal();
    var newConView = new NewConView();
    App.tableContainer.close();
    App.formContainer.show(newConView);
  });
});

