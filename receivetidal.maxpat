{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 59.0, 106.0, 1000.0, 700.0 ],
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 179.0, 125.0, 19.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "parseOSC.js",
						"parameter_enable" : 0
					}
,
					"text" : "js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 95.0, 158.0, 40.0, 22.0 ],
					"text" : "midiin"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 903.0, 627.0, 165.0, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 571.0, 88.0, 165.0, 41.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-31",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "LiveUI.Map.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
						"openinpresentation" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 289.0, 443.0, 50.0, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 544.0, 303.0, 50.0, 49.0 ],
									"text" : "\"Track Panning\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 393.0, 391.0, 50.0, 22.0 ],
									"text" : "id 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 211.429901000000058, 375.5, 70.0, 22.0 ],
									"text" : "route range"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 488.0, 379.0, 29.5, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 488.0, 350.0, 111.0, 22.0 ],
									"text" : "zl compare <none>"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-10",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 400.0, 21.0, 103.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Check Device State",
									"textjustification" : 0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 244.0, 45.0, 22.0 ],
									"text" : "unmap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 298.0, 244.0, 102.0, 22.0 ],
									"text" : "prepend mapping"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.964705882352941, 0.705882352941177, 0.298039215686275, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "int", "" ],
									"patching_rect" : [ 298.0, 285.0, 209.0, 22.0 ],
									"saved_object_attributes" : 									{
										"_persistence" : 1
									}
,
									"text" : "live.map @strict 1"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-1",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 652.0, 206.5, 116.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Additonal UI Elements",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-22",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal Out",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-23",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 329.5, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Param ID",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"comment" : "parameter id",
									"id" : "obj-25",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 345.5, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 488.0, 459.0, 29.5, 22.0 ],
									"text" : "id 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 488.0, 427.0, 34.0, 22.0 ],
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-32",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 23.0, 21.0, 52.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal IN",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 1.0, 0.71, 0.196, 0.0 ],
									"activebgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"activetextcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"annotation" : "",
									"appearance" : 2,
									"bgcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"id" : "obj-34",
									"ignoreclick" : 1,
									"lcdbgcolor" : [ 0.098039215686275, 0.098039215686275, 0.098039215686275, 0.0 ],
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 657.0, 232.5, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"lcdbgcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "border[5]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "border",
											"parameter_type" : 2
										}

									}
,
									"text" : " ",
									"textcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"textoffcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"texton" : " ",
									"varname" : "border[2]"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 174.0, 1365.0, 692.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-5",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 680.0, 45.0, 156.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Get device color info from Live",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 0,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-24",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 183.5, 644.0, 90.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Set Button Color",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-4",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 471.0, 38.0, 70.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Mapped?",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-2",
													"linecount" : 3,
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 122.5, 12.0, 77.0, 46.0 ],
													"suppressinlet" : 1,
													"text" : "Start blinking for new mappings",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontface" : 0,
													"fontname" : "Ableton Sans Medium",
													"fontsize" : 11.0,
													"id" : "obj-21",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 304.0, 517.0, 122.0, 46.0 ],
													"saved_attribute_attributes" : 													{
														"textcolor" : 														{
															"expression" : "themecolor.live_control_fg"
														}

													}
,
													"suppressinlet" : 1,
													"text" : "interchange the button background and text color while blinking"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 491.0, 306.0, 22.0, 22.0 ],
													"text" : "t b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 514.0, 342.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 627.0, 119.0, 30.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 965.5, 405.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 280.0, 570.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 145.0, 259.0, 24.0, 24.0 ],
													"svg" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-98",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 385.0, 55.0, 22.0 ],
													"text" : "zl slice 3"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-97",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 246.0, 385.0, 32.0, 22.0 ],
													"text" : "t 0.5"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-96",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 216.0, 385.0, 25.0, 22.0 ],
													"text" : "t 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-95",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 216.0, 420.0, 72.0, 22.0 ],
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-94",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 352.0, 38.0, 22.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-81",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 145.0, 297.0, 90.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-83",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 680.0, 226.0, 114.0, 22.0 ],
													"text" : "route lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-84",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 680.0, 140.0, 83.0, 22.0 ],
													"text" : "lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-85",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"patching_rect" : [ 680.0, 171.0, 62.0, 22.0 ],
													"text" : "live.colors"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-86",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 570.0, 117.0, 22.0 ],
													"text" : "lcdcolor $1 $2 $3 $4"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-87",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 216.0, 352.0, 79.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-88",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 466.0, 62.0, 22.0 ],
													"text" : "append 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-89",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 145.0, 118.0, 336.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-90",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 145.0, 157.0, 154.0, 22.0 ],
													"text" : "t 1 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-91",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 304.0, 157.0, 32.0, 22.0 ],
													"text" : "t 0 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-92",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 145.0, 226.0, 69.0, 22.0 ],
													"text" : "qmetro 200"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-80",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 226.0, 30.0, 22.0 ],
													"text" : "i 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-77",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "int", "int" ],
													"patching_rect" : [ 680.0, 69.0, 166.0, 22.0 ],
													"text" : "live.thisdevice"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-74",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 569.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-75",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 785.0, 405.0, 157.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-76",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 377.0, 153.0, 22.0 ],
													"text" : "lcdcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-73",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 570.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-72",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 396.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-71",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 502.0, 368.0, 144.0, 22.0 ],
													"text" : "lcdcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-67",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 950.5, 377.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 770.0, 338.0, 380.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 770.0, 306.0, 30.0, 22.0 ],
													"text" : "i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-63",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 1134.0, 195.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-65",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1147.0, 226.0, 163.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-66",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1134.0, 259.0, 216.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"comment" : "to button",
													"id" : "obj-62",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 145.0, 634.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 491.0, 265.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) mapped status",
													"id" : "obj-10",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 65.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) waiting for new mapping",
													"id" : "obj-60",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 65.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"order" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-71", 0 ],
													"order" : 1,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-72", 0 ],
													"order" : 2,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 975.0, 555.0, 779.5, 555.0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-49", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-89", 0 ],
													"source" : [ "obj-60", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-65", 0 ],
													"source" : [ "obj-63", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-66", 0 ],
													"source" : [ "obj-63", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1156.5, 249.0, 1200.0, 249.0, 1200.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-65", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1143.5, 291.0, 1212.0, 291.0, 1212.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 960.0, 556.5, 779.5, 556.5 ],
													"source" : [ "obj-67", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-67", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-75", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-71", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-76", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-63", 0 ],
													"order" : 0,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"midpoints" : [ 763.0, 104.5, 636.5, 104.5 ],
													"order" : 1,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"source" : [ "obj-77", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"midpoints" : [ 647.5, 284.0, 790.5, 284.0 ],
													"source" : [ "obj-8", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-80", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-87", 0 ],
													"source" : [ "obj-81", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 0 ],
													"source" : [ "obj-81", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 1 ],
													"midpoints" : [ 689.5, 256.0, 246.0, 256.0, 246.0, 333.0, 173.5, 333.0 ],
													"source" : [ "obj-83", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-85", 0 ],
													"source" : [ "obj-84", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-83", 0 ],
													"source" : [ "obj-85", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"midpoints" : [ 732.5, 205.0, 772.0, 205.0, 772.0, 129.0, 689.5, 129.0 ],
													"source" : [ "obj-85", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-86", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-96", 0 ],
													"source" : [ "obj-87", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-97", 0 ],
													"source" : [ "obj-87", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-86", 0 ],
													"source" : [ "obj-88", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-90", 0 ],
													"source" : [ "obj-89", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-91", 0 ],
													"source" : [ "obj-89", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-81", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-90", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-90", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-91", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-91", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-92", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-98", 0 ],
													"source" : [ "obj-94", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-95", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-96", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-97", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-98", 0 ]
												}

											}
 ],
										"originid" : "pat-179"
									}
,
									"patching_rect" : [ 298.0, 118.0, 82.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p ButtonColor"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-81",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 237.0, 101.0, 22.0 ],
													"text" : "text $1, texton $1"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 9,
															"minor" : 0,
															"revision" : 0,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"classnamespace" : "box",
														"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
														"gridsize" : [ 15.0, 15.0 ],
														"boxes" : [ 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-3",
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 151.0, 264.0, 65.0, 20.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Add 3 dots."
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 0,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-24",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 443.0, 81.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Truncated text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 2,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-2",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 66.0, 49.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Full Text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-21",
																	"linecount" : 2,
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 124.0, 180.5, 140.0, 33.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Truncate text if longer than 12 characters."
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-40",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 360.0, 85.0, 22.0 ],
																	"text" : "zl join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-35",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ],
																	"patching_rect" : [ 28.0, 399.0, 40.0, 22.0 ],
																	"text" : "itoa"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-30",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "zlclear" ],
																	"patching_rect" : [ 28.0, 147.0, 292.0, 22.0 ],
																	"text" : "t l zlclear"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-28",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 94.0, 264.0, 55.0, 22.0 ],
																	"text" : "46 46 46"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-25",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ],
																	"patching_rect" : [ 94.0, 225.0, 22.0, 22.0 ],
																	"text" : "t b"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-11",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 186.0, 85.0, 22.0 ],
																	"text" : "zl slice 12"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-1",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "list" ],
																	"patching_rect" : [ 28.0, 108.0, 40.0, 22.0 ],
																	"text" : "atoi"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) text",
																	"id" : "obj-20",
																	"index" : 1,
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 28.0, 61.0, 30.0, 30.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) clipped text",
																	"id" : "obj-22",
																	"index" : 1,
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 28.0, 438.0, 30.0, 30.0 ]
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 0 ],
																	"source" : [ "obj-1", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"source" : [ "obj-11", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 0 ],
																	"source" : [ "obj-11", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-1", 0 ],
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-28", 0 ],
																	"source" : [ "obj-25", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"source" : [ "obj-28", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"source" : [ "obj-30", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"midpoints" : [ 310.5, 329.0, 103.5, 329.0 ],
																	"source" : [ "obj-30", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-22", 0 ],
																	"source" : [ "obj-35", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-35", 0 ],
																	"source" : [ "obj-40", 0 ]
																}

															}
 ],
														"originid" : "pat-183"
													}
,
													"patching_rect" : [ 46.0, 185.0, 87.0, 22.0 ],
													"saved_object_attributes" : 													{
														"globalpatchername" : ""
													}
,
													"text" : "p TruncateText"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-41",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 46.0, 128.0, 131.0, 22.0 ],
													"text" : "substitute <none> Map"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(lom id) parameter",
													"id" : "obj-79",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 61.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-80",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.0, 287.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"source" : [ "obj-79", 0 ]
												}

											}
 ],
										"originid" : "pat-181"
									}
,
									"patching_rect" : [ 222.0, 118.0, 69.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p SetName"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "float" ],
													"patching_rect" : [ 220.166666666666885, 69.0, 74.0, 22.0 ],
													"text" : "unpack 0. 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 61.25, 283.0, 29.5, 22.0 ],
													"text" : "!- 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 113.0, 60.0, 22.0 ],
													"text" : "clip~ 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-23",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 326.833333333333485, 222.0, 77.0, 20.0 ],
													"text" : "< New range"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 171.166666666666714, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 126.666666666666657, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 4,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 113.0, 152.500000000000199, 22.0 ],
													"text" : "pak 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-50",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "float", "float", "float", "float" ],
													"patching_rect" : [ 126.666666666666657, 142.0, 171.800000000000011, 22.0 ],
													"text" : "unpack 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-57",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-61",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 222.666666666666686, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 341.0, 100.166666666666657, 22.0 ],
													"text" : "+~ 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 312.0, 34.0, 22.0 ],
													"text" : "*~ 1."
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) signal to scale",
													"id" : "obj-72",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) min",
													"id" : "obj-73",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) max",
													"id" : "obj-74",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 171.166666666666714, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float, float) range",
													"id" : "obj-75",
													"index" : 4,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 220.166666666666885, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) scaled signal",
													"id" : "obj-76",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.25, 382.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 3 ],
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 2 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 1 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 4 ],
													"order" : 1,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 3 ],
													"order" : 1,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 0 ],
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 4 ],
													"order" : 0,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 3 ],
													"order" : 0,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 0 ],
													"source" : [ "obj-50", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"order" : 1,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"order" : 0,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 1 ],
													"source" : [ "obj-61", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 1 ],
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ],
										"originid" : "pat-185"
									}
,
									"patching_rect" : [ 34.0, 408.0, 196.429901000000029, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p Scale"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 531.0, 116.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "scaled signal",
									"id" : "obj-38",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 34.0, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 442.0, 119.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 158.0, 82.0, 22.0 ],
									"text" : "ignoreclick $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "int", "int" ],
									"patching_rect" : [ 410.0, 40.0, 83.0, 22.0 ],
									"text" : "live.thisdevice"
								}

							}
, 							{
								"box" : 								{
									"comment" : "(signal) signal to scale",
									"id" : "obj-43",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 34.0, 48.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 531.0, 158.0, 61.0, 22.0 ],
									"text" : "hidden $1"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
									"annotation_name" : "Max",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-45",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 152.2866006666668, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 125.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Max",
											"parameter_info" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
											"parameter_initial" : [ 100 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMax[4]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Max",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMax[4]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
									"annotation_name" : "Min",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-46",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 93.1433003333334, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 92.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Min",
											"parameter_info" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
											"parameter_initial" : [ 0 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMin[4]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Min",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMin[4]"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Unmaps the currently mapped parameter.",
									"annotation_name" : "Unmap",
									"appearance" : 2,
									"fontsize" : 6.0,
									"id" : "obj-47",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 442.0, 204.0, 25.0, 25.0 ],
									"pictures" : [ "multimap-unmap.svg", "multimap-unmap.svg" ],
									"presentation" : 1,
									"presentation_rect" : [ 76.0, 1.0, 15.0, 15.0 ],
									"remapsvgcolors" : 1,
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_annotation_name" : "Unmap",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Unmap[3]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Unmap",
											"parameter_type" : 2
										}

									}
,
									"text" : "X",
									"texton" : "x",
									"usepicture" : 1,
									"usesvgviewbox" : 1,
									"varname" : "live.text[2]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activebgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activetextcolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"activetextoncolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"annotation" : "When Map is turned on, the next Live parameter clicked on will be selected as a target and the menus wil be modified accordingly.   ",
									"annotation_name" : "Map",
									"appearance" : 2,
									"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bordercolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"id" : "obj-48",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 298.0, 204.0, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activebgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activetextcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"activetextoncolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"bgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bordercolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"textcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"textoffcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Map",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Map[3]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Map",
											"parameter_type" : 2
										}

									}
,
									"text" : "Track Pannin...",
									"textcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"textoffcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"texton" : "Track Pannin...",
									"varname" : "live.text"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"midpoints" : [ 497.5, 410.911227226257324, 610.0, 410.911227226257324, 610.0, 100.0, 540.5, 100.0 ],
									"order" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 1 ],
									"midpoints" : [ 497.5, 417.0, 618.0, 417.0, 618.0, 107.0, 370.5, 107.0 ],
									"order" : 2,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"midpoints" : [ 402.5, 318.0, 497.5, 318.0 ],
									"order" : 1,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"order" : 1,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"midpoints" : [ 450.0, 325.0, 269.89416499999993, 325.0, 269.89416499999993, 187.746642999999949, 307.5, 187.746642999999949 ],
									"order" : 1,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 497.5, 333.0, 220.929901000000058, 333.0 ],
									"source" : [ "obj-3", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"midpoints" : [ 402.5, 317.0, 201.25, 317.0, 201.25, 106.0, 231.5, 106.0 ],
									"order" : 2,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"order" : 1,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-42", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 2 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"midpoints" : [ 307.5, 235.5, 403.89416499999993, 235.5, 403.89416499999993, 97.5, 307.5, 97.5 ],
									"order" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 3 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-81", 0 ]
								}

							}
 ],
						"originid" : "pat-177"
					}
,
					"patching_rect" : [ 905.0, 605.0, 161.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 573.0, 66.0, 161.0, 17.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"id" : "obj-33",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 901.0, 602.0, 169.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 569.0, 63.0, 169.0, 23.0 ],
					"proportion" : 0.39,
					"rounded" : 4,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontsize" : 13.0,
					"id" : "obj-39",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1047.0, 683.0, 53.0, 23.0 ],
					"text" : "id 4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 905.0, 731.0, 161.0, 23.0 ],
					"saved_object_attributes" : 					{
						"_persistence" : 1,
						"depth" : 1.0,
						"smoothing" : 1.0
					}
,
					"text" : "live.modulate~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 727.0, 627.0, 165.0, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 395.0, 88.0, 165.0, 41.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-23",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "LiveUI.Map.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
						"openinpresentation" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 289.0, 443.0, 50.0, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 544.0, 303.0, 50.0, 49.0 ],
									"text" : "\"Track Panning\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 393.0, 391.0, 50.0, 22.0 ],
									"text" : "id 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 211.429901000000058, 375.5, 70.0, 22.0 ],
									"text" : "route range"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 488.0, 379.0, 29.5, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 488.0, 350.0, 111.0, 22.0 ],
									"text" : "zl compare <none>"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-10",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 400.0, 21.0, 103.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Check Device State",
									"textjustification" : 0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 244.0, 45.0, 22.0 ],
									"text" : "unmap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 298.0, 244.0, 102.0, 22.0 ],
									"text" : "prepend mapping"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.964705882352941, 0.705882352941177, 0.298039215686275, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "int", "" ],
									"patching_rect" : [ 298.0, 285.0, 209.0, 22.0 ],
									"saved_object_attributes" : 									{
										"_persistence" : 1
									}
,
									"text" : "live.map @strict 1"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-1",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 652.0, 206.5, 116.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Additonal UI Elements",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-22",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal Out",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-23",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 329.5, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Param ID",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"comment" : "parameter id",
									"id" : "obj-25",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 345.5, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 488.0, 459.0, 29.5, 22.0 ],
									"text" : "id 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 488.0, 427.0, 34.0, 22.0 ],
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-32",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 23.0, 21.0, 52.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal IN",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 1.0, 0.71, 0.196, 0.0 ],
									"activebgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"activetextcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"annotation" : "",
									"appearance" : 2,
									"bgcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"id" : "obj-34",
									"ignoreclick" : 1,
									"lcdbgcolor" : [ 0.098039215686275, 0.098039215686275, 0.098039215686275, 0.0 ],
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 657.0, 232.5, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"lcdbgcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "border[4]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "border",
											"parameter_type" : 2
										}

									}
,
									"text" : " ",
									"textcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"textoffcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"texton" : " ",
									"varname" : "border[2]"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 174.0, 1365.0, 692.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-5",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 680.0, 45.0, 156.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Get device color info from Live",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 0,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-24",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 183.5, 644.0, 90.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Set Button Color",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-4",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 471.0, 38.0, 70.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Mapped?",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-2",
													"linecount" : 3,
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 122.5, 12.0, 77.0, 46.0 ],
													"suppressinlet" : 1,
													"text" : "Start blinking for new mappings",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontface" : 0,
													"fontname" : "Ableton Sans Medium",
													"fontsize" : 11.0,
													"id" : "obj-21",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 304.0, 517.0, 122.0, 46.0 ],
													"saved_attribute_attributes" : 													{
														"textcolor" : 														{
															"expression" : "themecolor.live_control_fg"
														}

													}
,
													"suppressinlet" : 1,
													"text" : "interchange the button background and text color while blinking"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 491.0, 306.0, 22.0, 22.0 ],
													"text" : "t b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 514.0, 342.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 627.0, 119.0, 30.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 965.5, 405.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 280.0, 570.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 145.0, 259.0, 24.0, 24.0 ],
													"svg" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-98",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 385.0, 55.0, 22.0 ],
													"text" : "zl slice 3"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-97",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 246.0, 385.0, 32.0, 22.0 ],
													"text" : "t 0.5"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-96",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 216.0, 385.0, 25.0, 22.0 ],
													"text" : "t 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-95",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 216.0, 420.0, 72.0, 22.0 ],
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-94",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 352.0, 38.0, 22.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-81",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 145.0, 297.0, 90.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-83",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 680.0, 226.0, 114.0, 22.0 ],
													"text" : "route lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-84",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 680.0, 140.0, 83.0, 22.0 ],
													"text" : "lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-85",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"patching_rect" : [ 680.0, 171.0, 62.0, 22.0 ],
													"text" : "live.colors"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-86",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 570.0, 117.0, 22.0 ],
													"text" : "lcdcolor $1 $2 $3 $4"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-87",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 216.0, 352.0, 79.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-88",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 466.0, 62.0, 22.0 ],
													"text" : "append 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-89",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 145.0, 118.0, 336.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-90",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 145.0, 157.0, 154.0, 22.0 ],
													"text" : "t 1 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-91",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 304.0, 157.0, 32.0, 22.0 ],
													"text" : "t 0 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-92",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 145.0, 226.0, 69.0, 22.0 ],
													"text" : "qmetro 200"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-80",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 226.0, 30.0, 22.0 ],
													"text" : "i 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-77",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "int", "int" ],
													"patching_rect" : [ 680.0, 69.0, 166.0, 22.0 ],
													"text" : "live.thisdevice"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-74",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 569.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-75",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 785.0, 405.0, 157.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-76",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 377.0, 153.0, 22.0 ],
													"text" : "lcdcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-73",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 570.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-72",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 396.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-71",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 502.0, 368.0, 144.0, 22.0 ],
													"text" : "lcdcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-67",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 950.5, 377.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 770.0, 338.0, 380.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 770.0, 306.0, 30.0, 22.0 ],
													"text" : "i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-63",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 1134.0, 195.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-65",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1147.0, 226.0, 163.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-66",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1134.0, 259.0, 216.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"comment" : "to button",
													"id" : "obj-62",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 145.0, 634.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 491.0, 265.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) mapped status",
													"id" : "obj-10",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 65.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) waiting for new mapping",
													"id" : "obj-60",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 65.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"order" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-71", 0 ],
													"order" : 1,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-72", 0 ],
													"order" : 2,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 975.0, 555.0, 779.5, 555.0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-49", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-89", 0 ],
													"source" : [ "obj-60", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-65", 0 ],
													"source" : [ "obj-63", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-66", 0 ],
													"source" : [ "obj-63", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1156.5, 249.0, 1200.0, 249.0, 1200.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-65", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1143.5, 291.0, 1212.0, 291.0, 1212.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 960.0, 556.5, 779.5, 556.5 ],
													"source" : [ "obj-67", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-67", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-75", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-71", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-76", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-63", 0 ],
													"order" : 0,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"midpoints" : [ 763.0, 104.5, 636.5, 104.5 ],
													"order" : 1,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"source" : [ "obj-77", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"midpoints" : [ 647.5, 284.0, 790.5, 284.0 ],
													"source" : [ "obj-8", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-80", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-87", 0 ],
													"source" : [ "obj-81", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 0 ],
													"source" : [ "obj-81", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 1 ],
													"midpoints" : [ 689.5, 256.0, 246.0, 256.0, 246.0, 333.0, 173.5, 333.0 ],
													"source" : [ "obj-83", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-85", 0 ],
													"source" : [ "obj-84", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-83", 0 ],
													"source" : [ "obj-85", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"midpoints" : [ 732.5, 205.0, 772.0, 205.0, 772.0, 129.0, 689.5, 129.0 ],
													"source" : [ "obj-85", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-86", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-96", 0 ],
													"source" : [ "obj-87", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-97", 0 ],
													"source" : [ "obj-87", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-86", 0 ],
													"source" : [ "obj-88", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-90", 0 ],
													"source" : [ "obj-89", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-91", 0 ],
													"source" : [ "obj-89", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-81", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-90", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-90", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-91", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-91", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-92", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-98", 0 ],
													"source" : [ "obj-94", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-95", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-96", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-97", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-98", 0 ]
												}

											}
 ],
										"originid" : "pat-168"
									}
,
									"patching_rect" : [ 298.0, 118.0, 82.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p ButtonColor"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-81",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 237.0, 101.0, 22.0 ],
													"text" : "text $1, texton $1"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 9,
															"minor" : 0,
															"revision" : 0,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"classnamespace" : "box",
														"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
														"gridsize" : [ 15.0, 15.0 ],
														"boxes" : [ 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-3",
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 151.0, 264.0, 65.0, 20.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Add 3 dots."
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 0,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-24",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 443.0, 81.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Truncated text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 2,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-2",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 66.0, 49.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Full Text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-21",
																	"linecount" : 2,
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 124.0, 180.5, 140.0, 33.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Truncate text if longer than 12 characters."
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-40",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 360.0, 85.0, 22.0 ],
																	"text" : "zl join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-35",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ],
																	"patching_rect" : [ 28.0, 399.0, 40.0, 22.0 ],
																	"text" : "itoa"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-30",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "zlclear" ],
																	"patching_rect" : [ 28.0, 147.0, 292.0, 22.0 ],
																	"text" : "t l zlclear"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-28",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 94.0, 264.0, 55.0, 22.0 ],
																	"text" : "46 46 46"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-25",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ],
																	"patching_rect" : [ 94.0, 225.0, 22.0, 22.0 ],
																	"text" : "t b"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-11",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 186.0, 85.0, 22.0 ],
																	"text" : "zl slice 12"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-1",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "list" ],
																	"patching_rect" : [ 28.0, 108.0, 40.0, 22.0 ],
																	"text" : "atoi"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) text",
																	"id" : "obj-20",
																	"index" : 1,
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 28.0, 61.0, 30.0, 30.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) clipped text",
																	"id" : "obj-22",
																	"index" : 1,
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 28.0, 438.0, 30.0, 30.0 ]
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 0 ],
																	"source" : [ "obj-1", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"source" : [ "obj-11", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 0 ],
																	"source" : [ "obj-11", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-1", 0 ],
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-28", 0 ],
																	"source" : [ "obj-25", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"source" : [ "obj-28", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"source" : [ "obj-30", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"midpoints" : [ 310.5, 329.0, 103.5, 329.0 ],
																	"source" : [ "obj-30", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-22", 0 ],
																	"source" : [ "obj-35", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-35", 0 ],
																	"source" : [ "obj-40", 0 ]
																}

															}
 ],
														"originid" : "pat-172"
													}
,
													"patching_rect" : [ 46.0, 185.0, 87.0, 22.0 ],
													"saved_object_attributes" : 													{
														"globalpatchername" : ""
													}
,
													"text" : "p TruncateText"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-41",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 46.0, 128.0, 131.0, 22.0 ],
													"text" : "substitute <none> Map"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(lom id) parameter",
													"id" : "obj-79",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 61.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-80",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.0, 287.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"source" : [ "obj-79", 0 ]
												}

											}
 ],
										"originid" : "pat-170"
									}
,
									"patching_rect" : [ 222.0, 118.0, 69.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p SetName"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "float" ],
													"patching_rect" : [ 220.166666666666885, 69.0, 74.0, 22.0 ],
													"text" : "unpack 0. 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 61.25, 283.0, 29.5, 22.0 ],
													"text" : "!- 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 113.0, 60.0, 22.0 ],
													"text" : "clip~ 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-23",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 326.833333333333485, 222.0, 77.0, 20.0 ],
													"text" : "< New range"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 171.166666666666714, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 126.666666666666657, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 4,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 113.0, 152.500000000000199, 22.0 ],
													"text" : "pak 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-50",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "float", "float", "float", "float" ],
													"patching_rect" : [ 126.666666666666657, 142.0, 171.800000000000011, 22.0 ],
													"text" : "unpack 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-57",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-61",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 222.666666666666686, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 341.0, 100.166666666666657, 22.0 ],
													"text" : "+~ 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 312.0, 34.0, 22.0 ],
													"text" : "*~ 1."
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) signal to scale",
													"id" : "obj-72",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) min",
													"id" : "obj-73",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) max",
													"id" : "obj-74",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 171.166666666666714, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float, float) range",
													"id" : "obj-75",
													"index" : 4,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 220.166666666666885, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) scaled signal",
													"id" : "obj-76",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.25, 382.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 3 ],
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 2 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 1 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 4 ],
													"order" : 1,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 3 ],
													"order" : 1,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 0 ],
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 4 ],
													"order" : 0,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 3 ],
													"order" : 0,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 0 ],
													"source" : [ "obj-50", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"order" : 1,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"order" : 0,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 1 ],
													"source" : [ "obj-61", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 1 ],
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ],
										"originid" : "pat-174"
									}
,
									"patching_rect" : [ 34.0, 408.0, 196.429901000000029, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p Scale"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 531.0, 116.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "scaled signal",
									"id" : "obj-38",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 34.0, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 442.0, 119.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 158.0, 82.0, 22.0 ],
									"text" : "ignoreclick $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "int", "int" ],
									"patching_rect" : [ 410.0, 40.0, 83.0, 22.0 ],
									"text" : "live.thisdevice"
								}

							}
, 							{
								"box" : 								{
									"comment" : "(signal) signal to scale",
									"id" : "obj-43",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 34.0, 48.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 531.0, 158.0, 61.0, 22.0 ],
									"text" : "hidden $1"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
									"annotation_name" : "Max",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-45",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 152.2866006666668, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 125.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Max",
											"parameter_info" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
											"parameter_initial" : [ 100 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMax[3]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Max",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMax[3]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
									"annotation_name" : "Min",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-46",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 93.1433003333334, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 92.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Min",
											"parameter_info" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
											"parameter_initial" : [ 0 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMin[3]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Min",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMin[3]"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Unmaps the currently mapped parameter.",
									"annotation_name" : "Unmap",
									"appearance" : 2,
									"fontsize" : 6.0,
									"id" : "obj-47",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 442.0, 204.0, 25.0, 25.0 ],
									"pictures" : [ "multimap-unmap.svg", "multimap-unmap.svg" ],
									"presentation" : 1,
									"presentation_rect" : [ 76.0, 1.0, 15.0, 15.0 ],
									"remapsvgcolors" : 1,
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_annotation_name" : "Unmap",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Unmap[2]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Unmap",
											"parameter_type" : 2
										}

									}
,
									"text" : "X",
									"texton" : "x",
									"usepicture" : 1,
									"usesvgviewbox" : 1,
									"varname" : "live.text[2]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activebgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activetextcolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"activetextoncolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"annotation" : "When Map is turned on, the next Live parameter clicked on will be selected as a target and the menus wil be modified accordingly.   ",
									"annotation_name" : "Map",
									"appearance" : 2,
									"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bordercolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"id" : "obj-48",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 298.0, 204.0, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activebgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activetextcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"activetextoncolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"bgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bordercolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"textcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"textoffcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Map",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Map[2]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Map",
											"parameter_type" : 2
										}

									}
,
									"text" : "Track Pannin...",
									"textcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"textoffcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"texton" : "Track Pannin...",
									"varname" : "live.text"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"midpoints" : [ 497.5, 410.911227226257324, 610.0, 410.911227226257324, 610.0, 100.0, 540.5, 100.0 ],
									"order" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 1 ],
									"midpoints" : [ 497.5, 417.0, 618.0, 417.0, 618.0, 107.0, 370.5, 107.0 ],
									"order" : 2,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"midpoints" : [ 402.5, 318.0, 497.5, 318.0 ],
									"order" : 1,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"order" : 1,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"midpoints" : [ 450.0, 325.0, 269.89416499999993, 325.0, 269.89416499999993, 187.746642999999949, 307.5, 187.746642999999949 ],
									"order" : 1,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 497.5, 333.0, 220.929901000000058, 333.0 ],
									"source" : [ "obj-3", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"midpoints" : [ 402.5, 317.0, 201.25, 317.0, 201.25, 106.0, 231.5, 106.0 ],
									"order" : 2,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"order" : 1,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-42", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 2 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"midpoints" : [ 307.5, 235.5, 403.89416499999993, 235.5, 403.89416499999993, 97.5, 307.5, 97.5 ],
									"order" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 3 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-81", 0 ]
								}

							}
 ],
						"originid" : "pat-166"
					}
,
					"patching_rect" : [ 729.0, 605.0, 161.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 397.0, 66.0, 161.0, 17.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"id" : "obj-24",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 725.0, 602.0, 169.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 393.0, 63.0, 169.0, 23.0 ],
					"proportion" : 0.39,
					"rounded" : 4,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontsize" : 13.0,
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 871.0, 683.0, 53.0, 23.0 ],
					"text" : "id 4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 729.0, 731.0, 161.0, 23.0 ],
					"saved_object_attributes" : 					{
						"_persistence" : 1,
						"depth" : 1.0,
						"smoothing" : 1.0
					}
,
					"text" : "live.modulate~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 544.0, 627.0, 165.0, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 212.0, 88.0, 165.0, 41.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-17",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "LiveUI.Map.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
						"openinpresentation" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 289.0, 443.0, 50.0, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 544.0, 303.0, 50.0, 49.0 ],
									"text" : "\"Track Panning\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 393.0, 391.0, 50.0, 22.0 ],
									"text" : "id 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 211.429901000000058, 375.5, 70.0, 22.0 ],
									"text" : "route range"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 488.0, 379.0, 29.5, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 488.0, 350.0, 111.0, 22.0 ],
									"text" : "zl compare <none>"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-10",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 400.0, 21.0, 103.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Check Device State",
									"textjustification" : 0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 244.0, 45.0, 22.0 ],
									"text" : "unmap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 298.0, 244.0, 102.0, 22.0 ],
									"text" : "prepend mapping"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.964705882352941, 0.705882352941177, 0.298039215686275, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "int", "" ],
									"patching_rect" : [ 298.0, 285.0, 209.0, 22.0 ],
									"saved_object_attributes" : 									{
										"_persistence" : 1
									}
,
									"text" : "live.map @strict 1"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-1",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 652.0, 206.5, 116.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Additonal UI Elements",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-22",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal Out",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-23",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 329.5, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Param ID",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"comment" : "parameter id",
									"id" : "obj-25",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 345.5, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 488.0, 459.0, 29.5, 22.0 ],
									"text" : "id 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 488.0, 427.0, 34.0, 22.0 ],
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-32",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 23.0, 21.0, 52.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal IN",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 1.0, 0.71, 0.196, 0.0 ],
									"activebgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"activetextcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"annotation" : "",
									"appearance" : 2,
									"bgcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"id" : "obj-34",
									"ignoreclick" : 1,
									"lcdbgcolor" : [ 0.098039215686275, 0.098039215686275, 0.098039215686275, 0.0 ],
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 657.0, 232.5, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"lcdbgcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "border[3]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "border",
											"parameter_type" : 2
										}

									}
,
									"text" : " ",
									"textcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"textoffcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"texton" : " ",
									"varname" : "border[2]"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 174.0, 1365.0, 692.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-5",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 680.0, 45.0, 156.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Get device color info from Live",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 0,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-24",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 183.5, 644.0, 90.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Set Button Color",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-4",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 471.0, 38.0, 70.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Mapped?",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-2",
													"linecount" : 3,
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 122.5, 12.0, 77.0, 46.0 ],
													"suppressinlet" : 1,
													"text" : "Start blinking for new mappings",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontface" : 0,
													"fontname" : "Ableton Sans Medium",
													"fontsize" : 11.0,
													"id" : "obj-21",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 304.0, 517.0, 122.0, 46.0 ],
													"saved_attribute_attributes" : 													{
														"textcolor" : 														{
															"expression" : "themecolor.live_control_fg"
														}

													}
,
													"suppressinlet" : 1,
													"text" : "interchange the button background and text color while blinking"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 491.0, 306.0, 22.0, 22.0 ],
													"text" : "t b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 514.0, 342.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 627.0, 119.0, 30.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 965.5, 405.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 280.0, 570.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 145.0, 259.0, 24.0, 24.0 ],
													"svg" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-98",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 385.0, 55.0, 22.0 ],
													"text" : "zl slice 3"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-97",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 246.0, 385.0, 32.0, 22.0 ],
													"text" : "t 0.5"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-96",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 216.0, 385.0, 25.0, 22.0 ],
													"text" : "t 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-95",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 216.0, 420.0, 72.0, 22.0 ],
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-94",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 352.0, 38.0, 22.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-81",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 145.0, 297.0, 90.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-83",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 680.0, 226.0, 114.0, 22.0 ],
													"text" : "route lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-84",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 680.0, 140.0, 83.0, 22.0 ],
													"text" : "lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-85",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"patching_rect" : [ 680.0, 171.0, 62.0, 22.0 ],
													"text" : "live.colors"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-86",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 570.0, 117.0, 22.0 ],
													"text" : "lcdcolor $1 $2 $3 $4"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-87",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 216.0, 352.0, 79.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-88",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 466.0, 62.0, 22.0 ],
													"text" : "append 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-89",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 145.0, 118.0, 336.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-90",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 145.0, 157.0, 154.0, 22.0 ],
													"text" : "t 1 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-91",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 304.0, 157.0, 32.0, 22.0 ],
													"text" : "t 0 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-92",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 145.0, 226.0, 69.0, 22.0 ],
													"text" : "qmetro 200"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-80",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 226.0, 30.0, 22.0 ],
													"text" : "i 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-77",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "int", "int" ],
													"patching_rect" : [ 680.0, 69.0, 166.0, 22.0 ],
													"text" : "live.thisdevice"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-74",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 569.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-75",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 785.0, 405.0, 157.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-76",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 377.0, 153.0, 22.0 ],
													"text" : "lcdcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-73",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 570.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-72",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 396.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-71",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 502.0, 368.0, 144.0, 22.0 ],
													"text" : "lcdcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-67",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 950.5, 377.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 770.0, 338.0, 380.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 770.0, 306.0, 30.0, 22.0 ],
													"text" : "i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-63",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 1134.0, 195.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-65",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1147.0, 226.0, 163.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-66",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1134.0, 259.0, 216.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"comment" : "to button",
													"id" : "obj-62",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 145.0, 634.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 491.0, 265.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) mapped status",
													"id" : "obj-10",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 65.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) waiting for new mapping",
													"id" : "obj-60",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 65.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"order" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-71", 0 ],
													"order" : 1,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-72", 0 ],
													"order" : 2,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 975.0, 555.0, 779.5, 555.0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-49", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-89", 0 ],
													"source" : [ "obj-60", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-65", 0 ],
													"source" : [ "obj-63", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-66", 0 ],
													"source" : [ "obj-63", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1156.5, 249.0, 1200.0, 249.0, 1200.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-65", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1143.5, 291.0, 1212.0, 291.0, 1212.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 960.0, 556.5, 779.5, 556.5 ],
													"source" : [ "obj-67", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-67", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-75", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-71", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-76", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-63", 0 ],
													"order" : 0,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"midpoints" : [ 763.0, 104.5, 636.5, 104.5 ],
													"order" : 1,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"source" : [ "obj-77", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"midpoints" : [ 647.5, 284.0, 790.5, 284.0 ],
													"source" : [ "obj-8", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-80", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-87", 0 ],
													"source" : [ "obj-81", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 0 ],
													"source" : [ "obj-81", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 1 ],
													"midpoints" : [ 689.5, 256.0, 246.0, 256.0, 246.0, 333.0, 173.5, 333.0 ],
													"source" : [ "obj-83", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-85", 0 ],
													"source" : [ "obj-84", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-83", 0 ],
													"source" : [ "obj-85", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"midpoints" : [ 732.5, 205.0, 772.0, 205.0, 772.0, 129.0, 689.5, 129.0 ],
													"source" : [ "obj-85", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-86", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-96", 0 ],
													"source" : [ "obj-87", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-97", 0 ],
													"source" : [ "obj-87", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-86", 0 ],
													"source" : [ "obj-88", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-90", 0 ],
													"source" : [ "obj-89", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-91", 0 ],
													"source" : [ "obj-89", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-81", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-90", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-90", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-91", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-91", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-92", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-98", 0 ],
													"source" : [ "obj-94", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-95", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-96", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-97", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-98", 0 ]
												}

											}
 ],
										"originid" : "pat-157"
									}
,
									"patching_rect" : [ 298.0, 118.0, 82.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p ButtonColor"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-81",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 237.0, 101.0, 22.0 ],
													"text" : "text $1, texton $1"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 9,
															"minor" : 0,
															"revision" : 0,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"classnamespace" : "box",
														"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
														"gridsize" : [ 15.0, 15.0 ],
														"boxes" : [ 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-3",
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 151.0, 264.0, 65.0, 20.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Add 3 dots."
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 0,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-24",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 443.0, 81.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Truncated text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 2,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-2",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 66.0, 49.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Full Text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-21",
																	"linecount" : 2,
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 124.0, 180.5, 140.0, 33.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Truncate text if longer than 12 characters."
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-40",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 360.0, 85.0, 22.0 ],
																	"text" : "zl join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-35",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ],
																	"patching_rect" : [ 28.0, 399.0, 40.0, 22.0 ],
																	"text" : "itoa"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-30",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "zlclear" ],
																	"patching_rect" : [ 28.0, 147.0, 292.0, 22.0 ],
																	"text" : "t l zlclear"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-28",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 94.0, 264.0, 55.0, 22.0 ],
																	"text" : "46 46 46"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-25",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ],
																	"patching_rect" : [ 94.0, 225.0, 22.0, 22.0 ],
																	"text" : "t b"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-11",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 186.0, 85.0, 22.0 ],
																	"text" : "zl slice 12"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-1",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "list" ],
																	"patching_rect" : [ 28.0, 108.0, 40.0, 22.0 ],
																	"text" : "atoi"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) text",
																	"id" : "obj-20",
																	"index" : 1,
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 28.0, 61.0, 30.0, 30.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) clipped text",
																	"id" : "obj-22",
																	"index" : 1,
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 28.0, 438.0, 30.0, 30.0 ]
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 0 ],
																	"source" : [ "obj-1", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"source" : [ "obj-11", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 0 ],
																	"source" : [ "obj-11", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-1", 0 ],
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-28", 0 ],
																	"source" : [ "obj-25", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"source" : [ "obj-28", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"source" : [ "obj-30", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"midpoints" : [ 310.5, 329.0, 103.5, 329.0 ],
																	"source" : [ "obj-30", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-22", 0 ],
																	"source" : [ "obj-35", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-35", 0 ],
																	"source" : [ "obj-40", 0 ]
																}

															}
 ],
														"originid" : "pat-161"
													}
,
													"patching_rect" : [ 46.0, 185.0, 87.0, 22.0 ],
													"saved_object_attributes" : 													{
														"globalpatchername" : ""
													}
,
													"text" : "p TruncateText"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-41",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 46.0, 128.0, 131.0, 22.0 ],
													"text" : "substitute <none> Map"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(lom id) parameter",
													"id" : "obj-79",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 61.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-80",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.0, 287.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"source" : [ "obj-79", 0 ]
												}

											}
 ],
										"originid" : "pat-159"
									}
,
									"patching_rect" : [ 222.0, 118.0, 69.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p SetName"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "float" ],
													"patching_rect" : [ 220.166666666666885, 69.0, 74.0, 22.0 ],
													"text" : "unpack 0. 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 61.25, 283.0, 29.5, 22.0 ],
													"text" : "!- 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 113.0, 60.0, 22.0 ],
													"text" : "clip~ 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-23",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 326.833333333333485, 222.0, 77.0, 20.0 ],
													"text" : "< New range"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 171.166666666666714, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 126.666666666666657, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 4,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 113.0, 152.500000000000199, 22.0 ],
													"text" : "pak 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-50",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "float", "float", "float", "float" ],
													"patching_rect" : [ 126.666666666666657, 142.0, 171.800000000000011, 22.0 ],
													"text" : "unpack 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-57",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-61",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 222.666666666666686, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 341.0, 100.166666666666657, 22.0 ],
													"text" : "+~ 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 312.0, 34.0, 22.0 ],
													"text" : "*~ 1."
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) signal to scale",
													"id" : "obj-72",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) min",
													"id" : "obj-73",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) max",
													"id" : "obj-74",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 171.166666666666714, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float, float) range",
													"id" : "obj-75",
													"index" : 4,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 220.166666666666885, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) scaled signal",
													"id" : "obj-76",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.25, 382.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 3 ],
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 2 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 1 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 4 ],
													"order" : 1,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 3 ],
													"order" : 1,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 0 ],
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 4 ],
													"order" : 0,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 3 ],
													"order" : 0,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 0 ],
													"source" : [ "obj-50", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"order" : 1,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"order" : 0,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 1 ],
													"source" : [ "obj-61", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 1 ],
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ],
										"originid" : "pat-163"
									}
,
									"patching_rect" : [ 34.0, 408.0, 196.429901000000029, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p Scale"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 531.0, 116.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "scaled signal",
									"id" : "obj-38",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 34.0, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 442.0, 119.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 158.0, 82.0, 22.0 ],
									"text" : "ignoreclick $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "int", "int" ],
									"patching_rect" : [ 410.0, 40.0, 83.0, 22.0 ],
									"text" : "live.thisdevice"
								}

							}
, 							{
								"box" : 								{
									"comment" : "(signal) signal to scale",
									"id" : "obj-43",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 34.0, 48.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 531.0, 158.0, 61.0, 22.0 ],
									"text" : "hidden $1"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
									"annotation_name" : "Max",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-45",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 152.2866006666668, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 125.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Max",
											"parameter_info" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
											"parameter_initial" : [ 100 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMax[2]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Max",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMax[2]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
									"annotation_name" : "Min",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-46",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 93.1433003333334, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 92.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Min",
											"parameter_info" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
											"parameter_initial" : [ 0 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMin[2]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Min",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMin[2]"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Unmaps the currently mapped parameter.",
									"annotation_name" : "Unmap",
									"appearance" : 2,
									"fontsize" : 6.0,
									"id" : "obj-47",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 442.0, 204.0, 25.0, 25.0 ],
									"pictures" : [ "multimap-unmap.svg", "multimap-unmap.svg" ],
									"presentation" : 1,
									"presentation_rect" : [ 76.0, 1.0, 15.0, 15.0 ],
									"remapsvgcolors" : 1,
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_annotation_name" : "Unmap",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Unmap[1]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Unmap",
											"parameter_type" : 2
										}

									}
,
									"text" : "X",
									"texton" : "x",
									"usepicture" : 1,
									"usesvgviewbox" : 1,
									"varname" : "live.text[2]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activebgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activetextcolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"activetextoncolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"annotation" : "When Map is turned on, the next Live parameter clicked on will be selected as a target and the menus wil be modified accordingly.   ",
									"annotation_name" : "Map",
									"appearance" : 2,
									"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bordercolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"id" : "obj-48",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 298.0, 204.0, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activebgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activetextcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"activetextoncolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"bgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bordercolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"textcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"textoffcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Map",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Map[1]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Map",
											"parameter_type" : 2
										}

									}
,
									"text" : "Track Pannin...",
									"textcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"textoffcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"texton" : "Track Pannin...",
									"varname" : "live.text"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"midpoints" : [ 497.5, 410.911227226257324, 610.0, 410.911227226257324, 610.0, 100.0, 540.5, 100.0 ],
									"order" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 1 ],
									"midpoints" : [ 497.5, 417.0, 618.0, 417.0, 618.0, 107.0, 370.5, 107.0 ],
									"order" : 2,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"midpoints" : [ 402.5, 318.0, 497.5, 318.0 ],
									"order" : 1,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"order" : 1,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"midpoints" : [ 450.0, 325.0, 269.89416499999993, 325.0, 269.89416499999993, 187.746642999999949, 307.5, 187.746642999999949 ],
									"order" : 1,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 497.5, 333.0, 220.929901000000058, 333.0 ],
									"source" : [ "obj-3", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"midpoints" : [ 402.5, 317.0, 201.25, 317.0, 201.25, 106.0, 231.5, 106.0 ],
									"order" : 2,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"order" : 1,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-42", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 2 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"midpoints" : [ 307.5, 235.5, 403.89416499999993, 235.5, 403.89416499999993, 97.5, 307.5, 97.5 ],
									"order" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 3 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-81", 0 ]
								}

							}
 ],
						"originid" : "pat-155"
					}
,
					"patching_rect" : [ 546.0, 605.0, 161.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 214.0, 66.0, 161.0, 17.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"id" : "obj-18",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 542.0, 602.0, 169.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 210.0, 63.0, 169.0, 23.0 ],
					"proportion" : 0.39,
					"rounded" : 4,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontsize" : 13.0,
					"id" : "obj-19",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 688.0, 683.0, 53.0, 23.0 ],
					"text" : "id 4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 546.0, 731.0, 161.0, 23.0 ],
					"saved_object_attributes" : 					{
						"_persistence" : 1,
						"depth" : 1.0,
						"smoothing" : 1.0
					}
,
					"text" : "live.modulate~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 95.0, 680.0, 47.0, 22.0 ],
					"text" : "midiout"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 695.0, 78.0, 150.0, 87.0 ],
					"presentation_linecount" : 6,
					"text" : "that being said the makenote approach (specifying length at the time of dispatch) is much less prone to these kinds of confusing behaviours"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"linecount" : 11,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 432.0, 125.0, 150.0, 154.0 ],
					"presentation_linecount" : 11,
					"text" : "note that currently d1 is not sending any values but the triggers still sample the buffer, so values reset to 0 whenever d1 hits and d2 doesn't\nthis is basically expected behavior and shows that you shouldn't mix streams in one midi converter"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 586.0, 556.0, 81.0, 22.0 ],
					"text" : "poke~ buffy 5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 681.0, 556.0, 81.0, 22.0 ],
					"text" : "poke~ buffy 7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 789.0, 556.0, 81.0, 22.0 ],
					"text" : "poke~ buffy 8"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-54",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 462.0, 492.0, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 478.0, 552.0, 81.0, 22.0 ],
					"text" : "poke~ buffy 5"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 785.0, 506.0, 35.0, 22.0 ],
					"text" : "sah~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 715.0, 506.0, 35.0, 22.0 ],
					"text" : "sah~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 595.0, 514.0, 35.0, 22.0 ],
					"text" : "sah~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 520.0, 516.0, 35.0, 22.0 ],
					"text" : "sah~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 811.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 8"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 715.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 7"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 616.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 6"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 520.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 5"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 148.0, 552.0, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 426.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 4"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 334.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 242.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 32.0, 582.0, 82.0, 22.0 ],
					"saved_object_attributes" : 					{
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "rtt.makenote~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 274.0, 344.0, 56.0, 22.0 ],
					"text" : "round~ 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 154.0, 582.0, 81.0, 22.0 ],
					"text" : "poke~ buffy 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lato",
					"fontsize" : 11.595186999999999,
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 274.0, 384.0, 32.0, 22.0 ],
					"text" : "-~ 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 274.0, 302.0, 47.0, 22.0 ],
					"text" : "*~ 128."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 152.0, 440.0, 83.0, 22.0 ],
					"text" : "index~ buffy 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 274.0, 212.0, 99.0, 22.0 ],
					"text" : "phasor~ @lock 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 66.0, 239.5, 169.0, 22.0 ],
					"text" : "buffer~ buffy 8 8 @samps 128"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "live.scope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 353.0, 627.0, 165.0, 41.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 21.0, 88.0, 165.0, 41.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-2",
					"lockeddragscroll" : 0,
					"lockedsize" : 0,
					"maxclass" : "bpatcher",
					"name" : "LiveUI.Map.maxpat",
					"numinlets" : 1,
					"numoutlets" : 2,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 9,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
						"openinpresentation" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 289.0, 443.0, 50.0, 22.0 ],
									"text" : "0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 3,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 544.0, 303.0, 50.0, 49.0 ],
									"text" : "\"Track Panning\""
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 393.0, 391.0, 50.0, 22.0 ],
									"text" : "id 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 211.429901000000058, 375.5, 70.0, 22.0 ],
									"text" : "route range"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 488.0, 379.0, 29.5, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 488.0, 350.0, 111.0, 22.0 ],
									"text" : "zl compare <none>"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-10",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 400.0, 21.0, 103.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Check Device State",
									"textjustification" : 0
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 244.0, 45.0, 22.0 ],
									"text" : "unmap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 298.0, 244.0, 102.0, 22.0 ],
									"text" : "prepend mapping"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.964705882352941, 0.705882352941177, 0.298039215686275, 1.0 ],
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "int", "" ],
									"patching_rect" : [ 298.0, 285.0, 209.0, 22.0 ],
									"saved_object_attributes" : 									{
										"_persistence" : 1
									}
,
									"text" : "live.map @strict 1"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-1",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 652.0, 206.5, 116.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Additonal UI Elements",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-22",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 18.0, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal Out",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 0,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-23",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 329.5, 546.0, 62.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Param ID",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"comment" : "parameter id",
									"id" : "obj-25",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 345.5, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 488.0, 459.0, 29.5, 22.0 ],
									"text" : "id 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 488.0, 427.0, 34.0, 22.0 ],
									"text" : "sel 0"
								}

							}
, 							{
								"box" : 								{
									"bubbleside" : 2,
									"bubbleusescolors" : 1,
									"fontsize" : 11.0,
									"id" : "obj-32",
									"maxclass" : "live.comment",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 23.0, 21.0, 52.0, 20.0 ],
									"suppressinlet" : 1,
									"text" : "Signal IN",
									"textjustification" : 1
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 1.0, 0.71, 0.196, 0.0 ],
									"activebgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"activetextcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"annotation" : "",
									"appearance" : 2,
									"bgcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bgoncolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"bordercolor" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"id" : "obj-34",
									"ignoreclick" : 1,
									"lcdbgcolor" : [ 0.098039215686275, 0.098039215686275, 0.098039215686275, 0.0 ],
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 657.0, 232.5, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activebgoncolor" : 										{
											"expression" : ""
										}
,
										"activetextcolor" : 										{
											"expression" : ""
										}
,
										"bgcolor" : 										{
											"expression" : ""
										}
,
										"bgoncolor" : 										{
											"expression" : ""
										}
,
										"bordercolor" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"lcdbgcolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"textoffcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "border[2]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "border",
											"parameter_type" : 2
										}

									}
,
									"text" : " ",
									"textcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"textoffcolor" : [ 1.0, 0.709804, 0.196078, 0.0 ],
									"texton" : " ",
									"varname" : "border[2]"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 174.0, 1365.0, 692.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-5",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 680.0, 45.0, 156.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Get device color info from Live",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 0,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-24",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 183.5, 644.0, 90.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Set Button Color",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-4",
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 471.0, 38.0, 70.0, 20.0 ],
													"suppressinlet" : 1,
													"text" : "Mapped?",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontsize" : 11.0,
													"id" : "obj-2",
													"linecount" : 3,
													"maxclass" : "live.comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 122.5, 12.0, 77.0, 46.0 ],
													"suppressinlet" : 1,
													"text" : "Start blinking for new mappings",
													"textjustification" : 1
												}

											}
, 											{
												"box" : 												{
													"bubbleside" : 2,
													"bubbleusescolors" : 1,
													"fontface" : 0,
													"fontname" : "Ableton Sans Medium",
													"fontsize" : 11.0,
													"id" : "obj-21",
													"linecount" : 3,
													"maxclass" : "comment",
													"numinlets" : 0,
													"numoutlets" : 0,
													"patching_rect" : [ 304.0, 517.0, 122.0, 46.0 ],
													"saved_attribute_attributes" : 													{
														"textcolor" : 														{
															"expression" : "themecolor.live_control_fg"
														}

													}
,
													"suppressinlet" : 1,
													"text" : "interchange the button background and text color while blinking"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 491.0, 306.0, 22.0, 22.0 ],
													"text" : "t b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-11",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 514.0, 342.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 627.0, 119.0, 30.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 965.5, 405.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 280.0, 570.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "toggle",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"parameter_enable" : 0,
													"patching_rect" : [ 145.0, 259.0, 24.0, 24.0 ],
													"svg" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-98",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 385.0, 55.0, 22.0 ],
													"text" : "zl slice 3"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-97",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 246.0, 385.0, 32.0, 22.0 ],
													"text" : "t 0.5"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-96",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 216.0, 385.0, 25.0, 22.0 ],
													"text" : "t 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-95",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 216.0, 420.0, 72.0, 22.0 ],
													"text" : "prepend set"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-94",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 145.0, 352.0, 38.0, 22.0 ],
													"text" : "zl reg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-81",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "int" ],
													"patching_rect" : [ 145.0, 297.0, 90.0, 22.0 ],
													"text" : "t b i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-83",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 680.0, 226.0, 114.0, 22.0 ],
													"text" : "route lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-84",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 680.0, 140.0, 83.0, 22.0 ],
													"text" : "lcd_control_fg"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-85",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "bang" ],
													"patching_rect" : [ 680.0, 171.0, 62.0, 22.0 ],
													"text" : "live.colors"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-86",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 570.0, 117.0, 22.0 ],
													"text" : "lcdcolor $1 $2 $3 $4"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-87",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 216.0, 352.0, 79.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-88",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 466.0, 62.0, 22.0 ],
													"text" : "append 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-89",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 145.0, 118.0, 336.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-90",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 145.0, 157.0, 154.0, 22.0 ],
													"text" : "t 1 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-91",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "int", "bang" ],
													"patching_rect" : [ 304.0, 157.0, 32.0, 22.0 ],
													"text" : "t 0 b"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-92",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 145.0, 226.0, 69.0, 22.0 ],
													"text" : "qmetro 200"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-80",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 226.0, 30.0, 22.0 ],
													"text" : "i 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-77",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "int", "int" ],
													"patching_rect" : [ 680.0, 69.0, 166.0, 22.0 ],
													"text" : "live.thisdevice"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-74",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 569.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-75",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 785.0, 405.0, 157.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-76",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 770.0, 377.0, 153.0, 22.0 ],
													"text" : "lcdcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-73",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 570.0, 19.0, 22.0 ],
													"text" : "t l"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-72",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 491.0, 396.0, 166.0, 22.0 ],
													"text" : "lcdbgcolor \"LCD Background\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-71",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 502.0, 368.0, 144.0, 22.0 ],
													"text" : "lcdcolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-67",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 950.5, 377.0, 237.0, 22.0 ],
													"text" : "inactivelcdcolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 770.0, 338.0, 380.0, 22.0 ],
													"text" : "sel 1 0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 770.0, 306.0, 30.0, 22.0 ],
													"text" : "i"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-63",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 1134.0, 195.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-65",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1147.0, 226.0, 163.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon\""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-66",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 1134.0, 259.0, 216.0, 22.0 ],
													"text" : "bordercolor \"LCD Text / Icon (Inactive)\""
												}

											}
, 											{
												"box" : 												{
													"comment" : "to button",
													"id" : "obj-62",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 145.0, 634.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 491.0, 265.0, 44.0, 22.0 ],
													"text" : "sel 0 1"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) mapped status",
													"id" : "obj-10",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 491.0, 65.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(bool) waiting for new mapping",
													"id" : "obj-60",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 145.0, 65.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"order" : 0,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-71", 0 ],
													"order" : 1,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-72", 0 ],
													"order" : 2,
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 975.0, 555.0, 779.5, 555.0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-49", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-89", 0 ],
													"source" : [ "obj-60", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-65", 0 ],
													"source" : [ "obj-63", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-66", 0 ],
													"source" : [ "obj-63", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1156.5, 249.0, 1200.0, 249.0, 1200.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-65", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"midpoints" : [ 1143.5, 291.0, 1212.0, 291.0, 1212.0, 621.0, 154.5, 621.0 ],
													"source" : [ "obj-66", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"midpoints" : [ 960.0, 556.5, 779.5, 556.5 ],
													"source" : [ "obj-67", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-67", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-75", 0 ],
													"order" : 0,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"order" : 1,
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-71", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-73", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-74", 0 ],
													"source" : [ "obj-76", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-63", 0 ],
													"order" : 0,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"midpoints" : [ 763.0, 104.5, 636.5, 104.5 ],
													"order" : 1,
													"source" : [ "obj-77", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"source" : [ "obj-77", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"midpoints" : [ 647.5, 284.0, 790.5, 284.0 ],
													"source" : [ "obj-8", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-80", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-87", 0 ],
													"source" : [ "obj-81", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 0 ],
													"source" : [ "obj-81", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-94", 1 ],
													"midpoints" : [ 689.5, 256.0, 246.0, 256.0, 246.0, 333.0, 173.5, 333.0 ],
													"source" : [ "obj-83", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-85", 0 ],
													"source" : [ "obj-84", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-83", 0 ],
													"source" : [ "obj-85", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-84", 0 ],
													"midpoints" : [ 732.5, 205.0, 772.0, 205.0, 772.0, 129.0, 689.5, 129.0 ],
													"source" : [ "obj-85", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-62", 0 ],
													"source" : [ "obj-86", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-96", 0 ],
													"source" : [ "obj-87", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-97", 0 ],
													"source" : [ "obj-87", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-86", 0 ],
													"source" : [ "obj-88", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-90", 0 ],
													"source" : [ "obj-89", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-91", 0 ],
													"source" : [ "obj-89", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-81", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-90", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-90", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-91", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-92", 0 ],
													"source" : [ "obj-91", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-92", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-98", 0 ],
													"source" : [ "obj-94", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-95", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-96", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-95", 0 ],
													"source" : [ "obj-97", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-88", 0 ],
													"source" : [ "obj-98", 0 ]
												}

											}
 ],
										"originid" : "pat-116"
									}
,
									"patching_rect" : [ 298.0, 118.0, 82.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p ButtonColor"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-81",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 193.0, 172.0, 806.0, 578.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 237.0, 101.0, 22.0 ],
													"text" : "text $1, texton $1"
												}

											}
, 											{
												"box" : 												{
													"color" : [ 1.0, 0.694117647058824, 0.0, 1.0 ],
													"id" : "obj-21",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patcher" : 													{
														"fileversion" : 1,
														"appversion" : 														{
															"major" : 9,
															"minor" : 0,
															"revision" : 0,
															"architecture" : "x64",
															"modernui" : 1
														}
,
														"classnamespace" : "box",
														"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
														"gridsize" : [ 15.0, 15.0 ],
														"boxes" : [ 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-3",
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 151.0, 264.0, 65.0, 20.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Add 3 dots."
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 0,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-24",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 443.0, 81.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Truncated text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleside" : 2,
																	"bubbleusescolors" : 1,
																	"fontsize" : 11.0,
																	"id" : "obj-2",
																	"maxclass" : "live.comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 67.0, 66.0, 49.0, 20.0 ],
																	"suppressinlet" : 1,
																	"text" : "Full Text",
																	"textjustification" : 1
																}

															}
, 															{
																"box" : 																{
																	"bubbleusescolors" : 1,
																	"fontface" : 0,
																	"fontname" : "Ableton Sans Medium",
																	"fontsize" : 11.0,
																	"id" : "obj-21",
																	"linecount" : 2,
																	"maxclass" : "comment",
																	"numinlets" : 0,
																	"numoutlets" : 0,
																	"patching_rect" : [ 124.0, 180.5, 140.0, 33.0 ],
																	"saved_attribute_attributes" : 																	{
																		"textcolor" : 																		{
																			"expression" : "themecolor.live_control_fg"
																		}

																	}
,
																	"suppressinlet" : 1,
																	"text" : "Truncate text if longer than 12 characters."
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-40",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 360.0, 85.0, 22.0 ],
																	"text" : "zl join"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-35",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "int" ],
																	"patching_rect" : [ 28.0, 399.0, 40.0, 22.0 ],
																	"text" : "itoa"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-30",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "zlclear" ],
																	"patching_rect" : [ 28.0, 147.0, 292.0, 22.0 ],
																	"text" : "t l zlclear"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-28",
																	"maxclass" : "message",
																	"numinlets" : 2,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 94.0, 264.0, 55.0, 22.0 ],
																	"text" : "46 46 46"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-25",
																	"maxclass" : "newobj",
																	"numinlets" : 1,
																	"numoutlets" : 1,
																	"outlettype" : [ "bang" ],
																	"patching_rect" : [ 94.0, 225.0, 22.0, 22.0 ],
																	"text" : "t b"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-11",
																	"maxclass" : "newobj",
																	"numinlets" : 2,
																	"numoutlets" : 2,
																	"outlettype" : [ "", "" ],
																	"patching_rect" : [ 28.0, 186.0, 85.0, 22.0 ],
																	"text" : "zl slice 12"
																}

															}
, 															{
																"box" : 																{
																	"id" : "obj-1",
																	"maxclass" : "newobj",
																	"numinlets" : 3,
																	"numoutlets" : 1,
																	"outlettype" : [ "list" ],
																	"patching_rect" : [ 28.0, 108.0, 40.0, 22.0 ],
																	"text" : "atoi"
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) text",
																	"id" : "obj-20",
																	"index" : 1,
																	"maxclass" : "inlet",
																	"numinlets" : 0,
																	"numoutlets" : 1,
																	"outlettype" : [ "" ],
																	"patching_rect" : [ 28.0, 61.0, 30.0, 30.0 ]
																}

															}
, 															{
																"box" : 																{
																	"comment" : "(symbol) clipped text",
																	"id" : "obj-22",
																	"index" : 1,
																	"maxclass" : "outlet",
																	"numinlets" : 1,
																	"numoutlets" : 0,
																	"patching_rect" : [ 28.0, 438.0, 30.0, 30.0 ]
																}

															}
 ],
														"lines" : [ 															{
																"patchline" : 																{
																	"destination" : [ "obj-30", 0 ],
																	"source" : [ "obj-1", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-25", 0 ],
																	"source" : [ "obj-11", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 0 ],
																	"source" : [ "obj-11", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-1", 0 ],
																	"source" : [ "obj-20", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-28", 0 ],
																	"source" : [ "obj-25", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"source" : [ "obj-28", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-11", 0 ],
																	"source" : [ "obj-30", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-40", 1 ],
																	"midpoints" : [ 310.5, 329.0, 103.5, 329.0 ],
																	"source" : [ "obj-30", 1 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-22", 0 ],
																	"source" : [ "obj-35", 0 ]
																}

															}
, 															{
																"patchline" : 																{
																	"destination" : [ "obj-35", 0 ],
																	"source" : [ "obj-40", 0 ]
																}

															}
 ],
														"originid" : "pat-120"
													}
,
													"patching_rect" : [ 46.0, 185.0, 87.0, 22.0 ],
													"saved_object_attributes" : 													{
														"globalpatchername" : ""
													}
,
													"text" : "p TruncateText"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-41",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 46.0, 128.0, 131.0, 22.0 ],
													"text" : "substitute <none> Map"
												}

											}
, 											{
												"box" : 												{
													"comment" : "(lom id) parameter",
													"id" : "obj-79",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 46.0, 61.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-80",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.0, 287.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-80", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-21", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-41", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-41", 0 ],
													"source" : [ "obj-79", 0 ]
												}

											}
 ],
										"originid" : "pat-118"
									}
,
									"patching_rect" : [ 222.0, 118.0, 69.0, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p SetName"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.0, 1.0, 0.980392156862745, 1.0 ],
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 9,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 146.0, 1365.0, 720.0 ],
										"gridsize" : [ 15.0, 15.0 ],
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "float", "float" ],
													"patching_rect" : [ 220.166666666666885, 69.0, 74.0, 22.0 ],
													"text" : "unpack 0. 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-68",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 61.25, 283.0, 29.5, 22.0 ],
													"text" : "!- 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 113.0, 60.0, 22.0 ],
													"text" : "clip~ 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-23",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 326.833333333333485, 222.0, 77.0, 20.0 ],
													"text" : "< New range"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 171.166666666666714, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "float" ],
													"patching_rect" : [ 126.666666666666657, 69.0, 39.0, 22.0 ],
													"text" : "/ 100."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-49",
													"maxclass" : "newobj",
													"numinlets" : 4,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 113.0, 152.500000000000199, 22.0 ],
													"text" : "pak 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-50",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "float", "float", "float", "float" ],
													"patching_rect" : [ 126.666666666666657, 142.0, 171.800000000000011, 22.0 ],
													"text" : "unpack 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-57",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-61",
													"maxclass" : "newobj",
													"numinlets" : 6,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 222.666666666666686, 222.0, 90.0, 22.0 ],
													"text" : "scale 0. 1. 0. 1."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-69",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 341.0, 100.166666666666657, 22.0 ],
													"text" : "+~ 0."
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.25, 312.0, 34.0, 22.0 ],
													"text" : "*~ 1."
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) signal to scale",
													"id" : "obj-72",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "signal" ],
													"patching_rect" : [ 46.0, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) min",
													"id" : "obj-73",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 126.666666666666657, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float) max",
													"id" : "obj-74",
													"index" : 3,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 171.166666666666714, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(float, float) range",
													"id" : "obj-75",
													"index" : 4,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 220.166666666666885, 24.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "(signal) scaled signal",
													"id" : "obj-76",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 46.25, 382.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 3 ],
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 2 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 1 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-50", 0 ],
													"source" : [ "obj-49", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 4 ],
													"order" : 1,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 3 ],
													"order" : 1,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-57", 0 ],
													"source" : [ "obj-50", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 4 ],
													"order" : 0,
													"source" : [ "obj-50", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 3 ],
													"order" : 0,
													"source" : [ "obj-50", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-61", 0 ],
													"source" : [ "obj-50", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 0 ],
													"order" : 1,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-69", 1 ],
													"order" : 0,
													"source" : [ "obj-57", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-68", 1 ],
													"source" : [ "obj-61", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 1 ],
													"source" : [ "obj-68", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-76", 0 ],
													"source" : [ "obj-69", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-72", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-73", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-74", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-75", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-49", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ],
										"originid" : "pat-122"
									}
,
									"patching_rect" : [ 34.0, 408.0, 196.429901000000029, 22.0 ],
									"saved_object_attributes" : 									{
										"globalpatchername" : ""
									}
,
									"text" : "p Scale"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 531.0, 116.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "scaled signal",
									"id" : "obj-38",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 34.0, 507.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 442.0, 119.0, 30.0, 22.0 ],
									"text" : "!- 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 442.0, 158.0, 82.0, 22.0 ],
									"text" : "ignoreclick $1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "int", "int" ],
									"patching_rect" : [ 410.0, 40.0, 83.0, 22.0 ],
									"text" : "live.thisdevice"
								}

							}
, 							{
								"box" : 								{
									"comment" : "(signal) signal to scale",
									"id" : "obj-43",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "signal" ],
									"patching_rect" : [ 34.0, 48.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 531.0, 158.0, 61.0, 22.0 ],
									"text" : "hidden $1"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
									"annotation_name" : "Max",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-45",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 152.2866006666668, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 125.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Max",
											"parameter_info" : "Defines the modulation value generated when input value is at its maximum amplitude. Note that this value can be lower than Min.",
											"parameter_initial" : [ 100 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMax[1]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Max",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMax[1]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.94902, 0.376471, 0.0, 0.0 ],
									"activeslidercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"activetricolor2" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"annotation" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
									"annotation_name" : "Min",
									"appearance" : 4,
									"focusbordercolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"id" : "obj-46",
									"maxclass" : "live.numbox",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 93.1433003333334, 379.0, 46.0, 15.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 92.0, 1.0, 34.0, 15.0 ],
									"prototypename" : "amount",
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : ""
										}
,
										"activeslidercolor" : 										{
											"expression" : ""
										}
,
										"activetricolor2" : 										{
											"expression" : ""
										}
,
										"focusbordercolor" : 										{
											"expression" : ""
										}
,
										"textcolor" : 										{
											"expression" : ""
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Min",
											"parameter_info" : "Defines the modulation value generated when the input value is at its minimum amplitude. Note that this value can be higher than Max.",
											"parameter_initial" : [ 0 ],
											"parameter_initial_enable" : 1,
											"parameter_invisible" : 1,
											"parameter_linknames" : 1,
											"parameter_longname" : "TargetMin[1]",
											"parameter_mmax" : 100.0,
											"parameter_mmin" : -100.0,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Min",
											"parameter_type" : 1,
											"parameter_unitstyle" : 5
										}

									}
,
									"textcolor" : [ 1.0, 0.709804, 0.196078, 1.0 ],
									"textjustification" : 0,
									"varname" : "TargetMin[1]"
								}

							}
, 							{
								"box" : 								{
									"annotation" : "Unmaps the currently mapped parameter.",
									"annotation_name" : "Unmap",
									"appearance" : 2,
									"fontsize" : 6.0,
									"id" : "obj-47",
									"maxclass" : "live.text",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 442.0, 204.0, 25.0, 25.0 ],
									"pictures" : [ "multimap-unmap.svg", "multimap-unmap.svg" ],
									"presentation" : 1,
									"presentation_rect" : [ 76.0, 1.0, 15.0, 15.0 ],
									"remapsvgcolors" : 1,
									"saved_attribute_attributes" : 									{
										"valueof" : 										{
											"parameter_annotation_name" : "Unmap",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Unmap[11]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Unmap",
											"parameter_type" : 2
										}

									}
,
									"text" : "X",
									"texton" : "x",
									"usepicture" : 1,
									"usesvgviewbox" : 1,
									"varname" : "live.text[2]"
								}

							}
, 							{
								"box" : 								{
									"activebgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activebgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"activetextcolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"activetextoncolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"annotation" : "When Map is turned on, the next Live parameter clicked on will be selected as a target and the menus wil be modified accordingly.   ",
									"annotation_name" : "Map",
									"appearance" : 2,
									"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bgoncolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
									"bordercolor" : [ 0.931948395395052, 0.771744459193783, 0.523883756405412, 1.0 ],
									"id" : "obj-48",
									"maxclass" : "live.text",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"parameter_enable" : 1,
									"patching_rect" : [ 298.0, 204.0, 93.0, 19.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 1.0, 74.0, 15.0 ],
									"saved_attribute_attributes" : 									{
										"activebgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activebgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"activetextcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"activetextoncolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"bgcolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bgoncolor" : 										{
											"expression" : "themecolor.live_lcd_bg"
										}
,
										"bordercolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg"
										}
,
										"textcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"textoffcolor" : 										{
											"expression" : "themecolor.live_lcd_control_fg_zombie"
										}
,
										"valueof" : 										{
											"parameter_annotation_name" : "Map",
											"parameter_enum" : [ "val1", "val2" ],
											"parameter_invisible" : 2,
											"parameter_longname" : "Map[10]",
											"parameter_mmax" : 1,
											"parameter_modmode" : 0,
											"parameter_osc_name" : "<default>",
											"parameter_shortname" : "Map",
											"parameter_type" : 2
										}

									}
,
									"text" : "Track Pannin...",
									"textcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"textoffcolor" : [ 0.325, 0.325, 0.325, 1.0 ],
									"texton" : "Track Pannin...",
									"varname" : "live.text"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"order" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"midpoints" : [ 497.5, 410.911227226257324, 610.0, 410.911227226257324, 610.0, 100.0, 540.5, 100.0 ],
									"order" : 0,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 1 ],
									"midpoints" : [ 497.5, 417.0, 618.0, 417.0, 618.0, 107.0, 370.5, 107.0 ],
									"order" : 2,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-29", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"midpoints" : [ 402.5, 318.0, 497.5, 318.0 ],
									"order" : 1,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-25", 0 ],
									"order" : 1,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"midpoints" : [ 450.0, 325.0, 269.89416499999993, 325.0, 269.89416499999993, 187.746642999999949, 307.5, 187.746642999999949 ],
									"order" : 1,
									"source" : [ "obj-3", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"midpoints" : [ 497.5, 333.0, 220.929901000000058, 333.0 ],
									"source" : [ "obj-3", 4 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 1 ],
									"order" : 0,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"midpoints" : [ 402.5, 317.0, 201.25, 317.0, 201.25, 106.0, 231.5, 106.0 ],
									"order" : 2,
									"source" : [ "obj-3", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"order" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"order" : 1,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-42", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 2 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 1 ],
									"source" : [ "obj-46", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"order" : 1,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"midpoints" : [ 307.5, 235.5, 403.89416499999993, 235.5, 403.89416499999993, 97.5, 307.5, 97.5 ],
									"order" : 0,
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 3 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-81", 0 ]
								}

							}
 ],
						"originid" : "pat-114"
					}
,
					"patching_rect" : [ 355.0, 605.0, 161.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 23.0, 66.0, 161.0, 17.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.079348079365577, 0.07934804057877, 0.079348050547289, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 351.0, 602.0, 169.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 19.0, 63.0, 169.0, 23.0 ],
					"proportion" : 0.39,
					"rounded" : 4,
					"saved_attribute_attributes" : 					{
						"bgfillcolor" : 						{
							"expression" : "themecolor.live_lcd_bg"
						}

					}

				}

			}
, 			{
				"box" : 				{
					"fontsize" : 13.0,
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 497.0, 683.0, 53.0, 23.0 ],
					"text" : "id 4"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 355.0, 731.0, 161.0, 23.0 ],
					"saved_object_attributes" : 					{
						"_persistence" : 1,
						"depth" : 1.0,
						"smoothing" : 1.0
					}
,
					"text" : "live.modulate~"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 179.0, 86.0, 150.0, 22.0 ],
					"saved_object_attributes" : 					{
						"defer" : 1
					}
,
					"text" : "udpreceive 8000 @defer 1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 2 ],
					"source" : [ "obj-11", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 2 ],
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 2 ],
					"source" : [ "obj-13", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 2 ],
					"source" : [ "obj-15", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"order" : 0,
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"order" : 1,
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 1 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"order" : 0,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 1 ],
					"order" : 0,
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"order" : 1,
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 1 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 1 ],
					"order" : 0,
					"source" : [ "obj-31", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"order" : 1,
					"source" : [ "obj-31", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 5,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"order" : 6,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"order" : 1,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"order" : 3,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"order" : 10,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 1 ],
					"order" : 11,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"order" : 9,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"order" : 7,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"order" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 1 ],
					"order" : 2,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"order" : 4,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"order" : 12,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"order" : 8,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 1 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 2 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-5", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"order" : 3,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"order" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 1,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"order" : 2,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 1 ],
					"order" : 3,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 2 ],
					"source" : [ "obj-64", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 1 ],
					"order" : 2,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 1 ],
					"order" : 1,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 1 ],
					"order" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 4 ],
					"order" : 4,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 1 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 1 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
 ],
		"originid" : "pat-5",
		"parameters" : 		{
			"obj-17::obj-34" : [ "border[3]", "border", 0 ],
			"obj-17::obj-45" : [ "TargetMax[2]", "Max", 0 ],
			"obj-17::obj-46" : [ "TargetMin[2]", "Min", 0 ],
			"obj-17::obj-47" : [ "Unmap[1]", "Unmap", 0 ],
			"obj-17::obj-48" : [ "Map[1]", "Map", 0 ],
			"obj-23::obj-34" : [ "border[4]", "border", 0 ],
			"obj-23::obj-45" : [ "TargetMax[3]", "Max", 0 ],
			"obj-23::obj-46" : [ "TargetMin[3]", "Min", 0 ],
			"obj-23::obj-47" : [ "Unmap[2]", "Unmap", 0 ],
			"obj-23::obj-48" : [ "Map[2]", "Map", 0 ],
			"obj-2::obj-34" : [ "border[2]", "border", 0 ],
			"obj-2::obj-45" : [ "TargetMax[1]", "Max", 0 ],
			"obj-2::obj-46" : [ "TargetMin[1]", "Min", 0 ],
			"obj-2::obj-47" : [ "Unmap[11]", "Unmap", 0 ],
			"obj-2::obj-48" : [ "Map[10]", "Map", 0 ],
			"obj-31::obj-34" : [ "border[5]", "border", 0 ],
			"obj-31::obj-45" : [ "TargetMax[4]", "Max", 0 ],
			"obj-31::obj-46" : [ "TargetMin[4]", "Min", 0 ],
			"obj-31::obj-47" : [ "Unmap[3]", "Unmap", 0 ],
			"obj-31::obj-48" : [ "Map[3]", "Map", 0 ],
			"parameterbanks" : 			{
				"0" : 				{
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "multimap-unmap.svg",
				"bootpath" : "C74:/packages/Max for Live/media",
				"type" : "svg",
				"implicit" : 1
			}
, 			{
				"name" : "parseOSC.js",
				"bootpath" : "~/Documents/tidalbuffernode",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "rtt.makenote~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0
	}

}
