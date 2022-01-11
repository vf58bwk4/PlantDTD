(sql 
	(statement 
		(schema_statement 
			(schema_create 
				"CREATE" 
				(create_table_statement 
					"TABLE" 
					(schema_qualified_name 
						(identifier 
							(id_token "avalon_03_pon_inventory")
						) 
						"." 
						(identifier 
							(id_token "coupler_gf_ap")
						)
					) 
					(define_table 
						(define_columns 
							"(" 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "id")
									) 
									(data_type 
										(predefined_type "bigint")
									) 
									(constraint_common 
										(constr_body 
											"DEFAULT" 
											(vex 
												(value_expression_primary 
													(function_call 
														(schema_qualified_name_nontype 
															(identifier_nontype 
																(id_token "nextval")
															)
														) 
														"(" 
														(vex_or_named_notation 
															(vex 
																(value_expression_primary 
																	(unsigned_value_specification 
																		(character_string 'coupler_gf_ap_seq')
																	)
																)
															)
														) 
														")"
													)
												)
											)
										)
									) 
									(constraint_common 
										(constr_body "NOT NULL")
									)
								)
							)
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "coupling_ratio")
									) 
									(data_type 
										(predefined_type "character varying" (type_length "(" "2" ")"))
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "coupler_number")
									) 
									(data_type 
										(predefined_type "bigint")
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "gf_ap_id")
									) 
									(data_type 
										(predefined_type "bigint")
									)
								)
							) 
							"," 
							(table_column_def 
								(constraint_common 
									"CONSTRAINT" 
									(identifier 
										(id_token "coupler_gf_ap_pk")
									) 
									(constr_body 
										"PRIMARY KEY" 
										(names_in_parens 
											"(" 
											(names_references 
												(schema_qualified_name 
													(identifier 
														(id_token "id")
													)
												)
											) 
											")"
										) 
										index_parameters
									)
								)
							) 
							"," 
							(table_column_def 
								(constraint_common 
									"CONSTRAINT" 
									(identifier 
										(id_token "coupler_gf_ap_fk")
									) 
									(constr_body 
										"FOREIGN KEY" 
										(names_in_parens 
											"(" 
											(names_references 
												(schema_qualified_name 
													(identifier 
														(id_token "gf_ap_id")
													)
												)
											) 
											")"
										) 
										"REFERENCES" 
										(schema_qualified_name 
											(identifier 
												(id_token "gf_ap")
											)
										) 
										(names_in_parens 
											"(" 
											(names_references 
												(schema_qualified_name 
													(identifier 
														(id_token "id")
													)
												)
											) 
											")"
										)
									) 
									(table_deferrable "NOT DEFERRABLE")
								)
							) 
							")"
						)
					) 
					(storage_parameter_oid 
						(with_storage_parameter 
							"WITH" 
							(storage_parameter 
								"(" 
								(storage_parameter_option 
									(storage_parameter_name 
										(col_label 
											(tokens_nonreserved "oids")
										)
									) 
									"=" 
									(vex 
										(value_expression_primary 
											(unsigned_value_specification 
												(truth_value "false")
											)
										)
									)
								) 
								")"
							)
						)
					)
				)
			)
		)
	) 
	";" 
	(statement 
		(schema_statement 
			(schema_create 
				"CREATE" 
				(create_table_statement 
					"TABLE" 
					(schema_qualified_name 
						(identifier 
							(id_token "avalon_03_pon_inventory")
						) 
						"." 
						(identifier 
							(id_token "coupler_nvt")
						)
					) 
					(define_table 
						(define_columns 
							"(" 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "id")
									) 
									(data_type 
										(predefined_type "bigint")
									) 
									(constraint_common 
										(constr_body "NOT NULL")
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "coupling_ratio")
									) 
									(data_type 
										(predefined_type "character varying" (type_length "(" "2" ")"))
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "ums_raster")
									) 
									(data_type 
										(predefined_type "character varying" (type_length "(" "8" ")"))
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "ums_cassette_id")
									) 
									(data_type 
										(predefined_type "bigint")
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "created")
									) 
									(data_type 
										(predefined_type "timestamp")
									)
								)
							) 
							"," 
							(table_column_def 
								(table_column_definition 
									(identifier 
										(id_token "created_by")
									) 
									(data_type 
										(predefined_type "character varying" (type_length "(" "50" ")"))
									)
								)
							) 
							"," 
							(table_column_def 
								(constraint_common 
									"CONSTRAINT" 
									(identifier 
										(id_token "coupler_nvt_pkey")
									) 
									(constr_body 
										"PRIMARY KEY" 
										(names_in_parens 
											"(" 
											(names_references 
												(schema_qualified_name 
													(identifier 
														(id_token "id")
													)
												)
											) 
											")"
										) 
										index_parameters
									)
								)
							) 
							"," 
							(table_column_def 
								(constraint_common 
									"CONSTRAINT" 
									(identifier 
										(id_token "fk_coupler_nvt_ums_cassette")
									) 
									(constr_body 
										"FOREIGN KEY" 
										(names_in_parens 
											"(" 
											(names_references 
												(schema_qualified_name 
													(identifier 
														(id_token "ums_cassette_id")
													)
												)
											) 
											")"
										) 
										"REFERENCES" 
										(schema_qualified_name 
											(identifier 
												(id_token "ums_cassette")
											)
										) 
										(names_in_parens 
											"(" 
											(names_references 
												(schema_qualified_name 
													(identifier 
														(id_token "id")
													)
												)
											) 
											")"
										)
									)
									(table_deferrable "NOT DEFERRABLE")
								)
							) 
							")"
						)
					) 
					(storage_parameter_oid 
						(with_storage_parameter 
							"WITH" 
							(storage_parameter 
								"(" 
								(storage_parameter_option 
									(storage_parameter_name 
										(col_label 
											(tokens_nonreserved "oids")
										)
									) 
									"=" 
									(vex 
										(value_expression_primary 
											(unsigned_value_specification 
												(truth_value "false")
											)
										)
									)
								) 
								")"
							)
						)
					)
				)
			)
		)
	) 
	";" 
	<EOF>
)