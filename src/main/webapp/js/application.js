$(function () {
    $('#delete-selected').click(function () {
        $('#delete-selected').closest('form').submit();
    });

    $.i18n.init(window.i18nextOptions, function () {
        if (typeof $('.datatable').dataTable == 'function') {
            $('.datatable').dataTable({
                "oLanguage":{
                    "oAria":{
                        "sSortAscending":$.t('datatables.oAria.sSortAscending'),
                        "sSortDescending":$.t('datatables.oAria.sSortDescending')
                    },
                    "oPaginate":{
                        "sFirst":$.t('datatables.oPaginate.sFirst'),
                        "sLast":$.t('datatables.oPaginate.sLast'),
                        "sNext":$.t('datatables.oPaginate.sNext'),
                        "sPrevious":$.t('datatables.oPaginate.sPrevious')
                    },
                    "sEmptyTable":$.t('datatables.sEmptyTable'),
                    "sInfo":$.t('datatables.sInfo'),
                    "sInfoEmpty":$.t('datatables.sInfoEmpty'),
                    "sInfoFiltered":$.t('datatables.sInfoFiltered'),
                    "sInfoPostFix":$.t('datatables.sInfoPostFix'),
                    "sInfoThousands":$.t('datatables.sInfoThousands'),
                    "sLengthMenu":$.t('datatables.sLengthMenu'),
                    "sLoadingRecords":$.t('datatables.sLoadingRecords'),
                    "sProcessing":$.t('datatables.sProcessing'),
                    "sSearch":$.t('datatables.sSearch'),
                    "sZeroRecords":$.t('datatables.sZeroRecords')
                },
                "sDom":"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType":"bootstrap",
                "bServerSide":true,
                "sAjaxSource":$('.datatable').data("source-url"),
                "aoColumnDefs":[
                    { "bSortable":false, "aTargets":[ 0, -1 ] }
                ],
                "fnServerData":function (sSource, aoData, fnCallback) {
                    $.ajax({
                        "dataType":"json",
                        "type":"GET",
                        "url":sSource,
                        "data":aoData,
                        "success":function (json) {
                            var deleteRowUrl = $('.datatable').data("delete-row-url");
                            var editRowUrl = $('.datatable').data("edit-row-url");
                            $.each(json.aaData, function (index, value) {
                                var entityId = value[0]
                                value[0] = '<input name="id" type="checkbox" value="' + entityId + '">';
                                value.push('<a href="' + editRowUrl + "/" + entityId + '">edit</a> | <a data-method="delete" href="' + deleteRowUrl + "/?id=" + entityId + '">delete</a>');

                            });
                            fnCallback(json);
                        }
                    });
                }
            });
        }
    });
});