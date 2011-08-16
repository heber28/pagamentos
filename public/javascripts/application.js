// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(function($) {
    $.mask.definitions['~']='[+-]';
    $('#data').mask('99/99/9999');
    $('#cliente_telefone').mask('(99) 9999-9999');
    $('#cliente_celular').mask('(99) 9999-9999');
});