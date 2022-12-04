// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function window_output(){
	imguigml_text("Output")
	imguigml_input_text_multiline("##OutputLabel",global.comoutput,99999999999999,imguigml_get_window_width(),imguigml_get_window_height()-100,EImGui_InputTextFlags.ReadOnly)
}