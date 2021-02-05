//unload.gml

print_debug("unloaded " + test_string);
with (asset_get("draw_result_screen"))
{
    test_string = other.test_string;
}
keyboard_string = "hyeo  -- ";