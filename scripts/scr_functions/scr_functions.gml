// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function map(val, start1, end1, start2, end2)
{
	var prop = (val - start1)/(end1 - start1);
	return prop*(end2-start2) + start2;
}