clear
clc

% this demo show some datasource use mdl algorithm. you can use
% txt��xls or cvs instead mysql.
%
% if you find bug, you can send email to me.
%
% Written by WANGXin(growlithe1205@gmail.com)

% mysql default configure
datasource = 'growlithe';
username ='growlithe';
password = 'growlithe';
url = 'jdbc:mysql://localhost:3306/growlithe';

% list all abalone
% abalone_data = list_all_abalone(datasource,username,password,url);

% list_all_absenteeism_at_work
% absenteeism_at_work_data ...
%     = list_all_absenteeism_at_work(datasource,username,password,url);

% list_all_adult
% adult_data = list_all_adult(datasource,username,password,url);

% list_all_anuran_calls
% anuran_calls_data = list_all_anuran_calls(datasource,username,password,url);

% list_all_avila
% avila_data = list_all_avila(datasource,username,password,url);

% list_all_balance_scale
% balance_scale_data = list_all_balance_scale(datasource,username,password,url);

% list_all_bank_marketing
% bank_marketing_data = list_all_bank_marketing(datasource,username,password,url);

% list_all_banknote_authentication
% banknote_authentication_data ...
%     = list_all_banknote_authentication(datasource,username,password,url);

% list_all_blood_transfusion_service_center
% service_center_data ...
% = list_all_blood_transfusion_service_center(datasource,username,password,url);

% list all blood_transfusion_service_center
% blood_transfusion_service_center_data ...
% = list_all_blood_transfusion_service_center(datasource,username,password,url);

% list all breast_cancer_coimbra
% breast_cancer_coimbra_data ...
%     = list_all_breast_cancer_coimbra(datasource,username,password,url);

% list_all_breast_tissue
% breast_tissue_data = list_all_breast_tissue(datasource,username,password,url);

% list_all_car_evaluation
% car_evaluation_data = list_all_car_evaluation(datasource,username,password,url);

% list_all_chess_rook_vs_pawn
% chess_rook_vs_pawn_data = list_all_chess_rook_vs_pawn(datasource,username,password,url);

% list_all_congressional_voting_records
% congressional_voting_records_data ...
%     = list_all_congressional_voting_records(datasource,username,password,url);

% list_all_connect
% connect_data = list_all_connect(datasource,username,password,url);

% list_all_contraceptive_method_choice
% contraceptive_method_choice_data ...
%     = list_all_contraceptive_method_choice(datasource,username,password,url);

% list_all_iris
% iris_data = list_all_iris(datasource,username,password,url);

% list_all_magic_gamma_telescope
% magic_gamma_telescope_data ...
%     = list_all_magic_gamma_telescope(datasource,username,password,url);

% list_all_mushroom
% mushroom_data = list_all_mushroom(datasource,username,password,url);

% list_all_nursery
% nursery_data = list_all_nursery(datasource,username,password,url);

% list_all_seeds
% seeds_data = list_all_seeds(datasource,username,password,url);

% list_all_tic_tac_toe_endgame
% tic_tac_toe_endgame_data ...
%     = list_all_tic_tac_toe_endgame(datasource,username,password,url);

% list_all_wine
% wine_data = list_all_wine(datasource,username,password,url);

% list_all_zoo
zoo_data  = list_all_zoo(datasource,username,password,url);

function mdl_data = list_all_abalone(datasource,username,password,url)

select_var1 = 'sex,length,diameter,height,whole_weight,shucked_weight,';
select_var2 = 'viscera_weight,shell_weight,rings';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,' FROM uci_database.abalone where status = 1'];

class_index = 9;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_absenteeism_at_work(datasource,username,password,url)
% this data need preprocess class var
select_var1 = 'reason_for_absence,month_of_absence,day_of_week,seasons,';
select_var2 = 'transportation_expense,distance_from_residence_to_work,service_time,';
select_var3 = 'age,work_load_average_of_day,hit_target,disciplinary_failure,';
select_var4 = 'education,son,social_drinker,social_smoker,pet,weight,height,';
select_var5 = 'body_mass_index,absenteeism_time_in_hours';
select_var = [select_var1,select_var2,select_var3,select_var4,select_var5];
sql = ['SELECT ', select_var , ...
    ' FROM uci_database.absenteeism_at_work where status = 1'];

class_index = 20;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map,'fix_data','yes');
mdl_data = mdl_data';

end

function mdl_data = list_all_adult(datasource,username,password,url)


select_var1 = 'age,workclass,fnlwgt,education_num,marital_status,occupation,';
select_var2 = 'relationship,race,sex,capital_gain,capital_loss,hours_per_week,';
select_var3 = 'native_country,income_attributes,data_type';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,' FROM uci_database.adult where status = 1'];

class_index = 15;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_anuran_calls(datasource,username,password,url)

select_var1 = 'mfccs_a,mfccs_b,mfccs_c,mfccs_d,mfccs_e,mfccs_f,mfccs_g,';
select_var2 = 'mfccs_h,mfccs_i,mfccs_j,mfccs_k,mfccs_l,mfccs_m,mfccs_n,';
select_var3 = 'mfccs_o,mfccs_p,mfccs_q,mfccs_r,mfccs_s,mfccs_t,mfccs_u,';
select_var4 = 'mfccs_v,family,genus,species';
select_var = [select_var1,select_var2,select_var3,select_var4];
sql = ['SELECT ', select_var ,' FROM uci_database.anuran_calls where status = 1'];

class_index = 25;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_avila(datasource,username,password,url)

select_var1 = 'intercolumnar_distance,upper_margin,lower_margin,';
select_var2 = 'exploitation,row_no,modular_ratio,interlinear_spacing,';
select_var3 = 'weight,peak_number,modular_ratio_and_interlinear_spacing_rate,';
select_var4 = 'data_class';
select_var = [select_var1,select_var2,select_var3,select_var4];
sql = ['SELECT ', select_var ,' FROM uci_database.avila where status = 1'];

class_index = 11;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_balance_scale(datasource,username,password,url)

select_var = 'class_name,left_weight,left_distance,right_weight,right_distance';
sql = ['SELECT ', select_var ,' FROM uci_database.balance_scale where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_bank_marketing(datasource,username,password,url)

select_var1 = 'age,job,marital,education,default_credit,housing,loan,';
select_var2 = 'contact,month,day_of_week,duration,campaign,p_days,';
select_var3 = 'previous,pout_come,emp_var_rate,cons_price_idx,cons_conf_idx,';
select_var4 = 'euribor_m,nr_employed,class_name';
select_var = [select_var1,select_var2,select_var3,select_var4];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.bank_marketing where status = 1 and data_type = 1'];

class_index = 21;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_banknote_authentication(datasource,username,password,url)

select_var = 'variance,skewness,curtosis,entropy,class_name';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.banknote_authentication where status = 1'];

class_index = 5;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map,'fix_data','yes');
mdl_data = mdl_data';

end


function mdl_data ...
= list_all_blood_transfusion_service_center(datasource,username,password,url)

select_var = 'recency,frequency,monetary,time,class_name';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.blood_transfusion_service_center where status = 1'];

class_index = 5;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_breast_cancer(datasource,username,password,url)

select_var1 = 'class_name,age,menopause,tumor_size,inv_nodes,node_caps,';
select_var2 = 'deg_malig,breast,breast_quad,irradiat';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.breast_cancer where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_breast_cancer_coimbra(datasource,username,password,url)

select_var = 'age,bmi,glucose,Insulin,homa,leptin,adiponectin,resistin,mcp,classification';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.breast_cancer_coimbra where status = 1'];

class_index = 10;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_breast_tissue(datasource,username,password,url)

select_var1 = 'class_name,i,pa,hfs,da,area,';
select_var2 = 'ada,max_ip,dr,p';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.breast_tissue where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_car_evaluation(datasource,username,password,url)

select_var1 = 'buying,maint,doors,persons,lug_boot,safety,';
select_var2 = 'class_name';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.car_evaluation where status = 1'];

class_index = 7;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_census_income_kdd(datasource,username,password,url)

select_var1 = 'age,class_of_worker,class_of_worker,occupation_code,';
select_var2 = 'education,wage_per_hour,enrolled,marital_status,major_industry_code,';
select_var3 = 'major_occupation_code,mace,hispanic_origin,sex,member_of_labor_union,';
select_var4 = 'reason_for_unemployment,employment_stat,capital_gains,capital_losses,';
select_var5 = 'divdends_from_stocks,tax_filer_status,region_of_previous_residence,';
select_var6 = 'state_of_previous_residence,detailed_household_and_family_stat,';
select_var7 = 'detailed_household_summary,migration_code_change_msa,';
select_var8 = 'migration_code_change_reg,migration_code_move,live_in,migration,';
select_var9 = 'num_persons_worked,family_members,country_of_birth_father,';
select_var10 = 'country_of_birth_mother,country_of_birth_self,citizenship,own_business,';
select_var11 = 'fill_inc_questionnaire,veterans_benefits,weeks_worked,year,class_name';
select_var = [select_var1,select_var2,select_var3,select_var4,select_var5, ...
     select_var6,select_var7,select_var8,select_var9,select_var10,select_var11];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.census_income_kdd where status = 1 and data_type =1'];

class_index = 7;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_chess_rook_vs_king(datasource,username,password,url)

select_var1 = 'white_king_file,white_king_rank,white_rook_file,white_rook_rank,';
select_var2 = 'black_king_file,black_king_rank,class_name';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.chess_rook_vs_king where status = 1'];

class_index = 7;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_chess_rook_vs_pawn(datasource,username,password,url)

select_var1 = 'step_aa,step_ab,step_ac,step_ad,step_ae,step_af,step_ag,';
select_var2 = 'step_ah,step_ai,step_aj,step_ak,step_al,step_am,step_an,';
select_var3 = 'step_ao,step_ap,step_aq,step_ar,step_as,step_at,step_au,';
select_var4 = 'step_av,step_aw,step_ax,step_ay,step_az,step_ba,step_bb,';
select_var5 = 'step_bc,step_bd,step_be,step_bf,step_bg,step_bh,step_bi,';
select_var6 = 'step_bj,class_name';
select_var = [select_var1,select_var2,select_var3,select_var4,...
    select_var5,select_var6];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.chess_rook_vs_pawn where status = 1'];

class_index = 37;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_congressional_voting_records(datasource,username,password,url)

select_var1 = 'class_name,handicapped_infants,water_project_cost_sharing,';
select_var2 = 'adoption_of_the_budget_resolution,physician_fee_freeze,';
select_var3 = 'el_salvador_aid,religious_groups_in_schools,anti_satellite_test_ban,';
select_var4 = 'aid_to_nicaraguan_contras,mx_missile,immigration,synfuels_corporation_cutback,';
select_var5 = 'education_spending,superfund_right_to_sue,crime,duty_free_exports,';
select_var6 = 'export_administration_act_south_africa';
select_var = [select_var1,select_var2,select_var3,select_var4,...
    select_var5,select_var6];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.congressional_voting_records where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_connect(datasource,username,password,url)

select_var1 = 'class_name,aa,ab,ac,ad,ae,af,ba,bb,bc,bd,be,bf,ca,cb,cc,cd,ce,cf,';
select_var2 = 'da,db,dc,dd,de,df,ea,eb,ec,ed,ee,ef,ga,gb,gc,gd,ge,gf';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.connect where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_contraceptive_method_choice(datasource,username,password,url)

select_var1 = 'class_name,wife_age,wife_education,husband_education,children_number,';
select_var2 = 'wife_religion,wife_working_status,husband_occupation,standard_living,';
select_var3 = 'media_exposure';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.contraceptive_method_choice where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_covertype(datasource,username,password,url)
% gc out of memory
select_var1 = 'cover_type,elevation,aspect,slope,horizontal_distance_to_hydrology,';
select_var2 = 'vertical_distance_to_hydrology,horizontal_distance_to_roadways,';
select_var3 = 'hillshade_am,hillshade_noon,hillshade_pm,horizontal_distance_to_fire_points,';
select_var4 = 'wilderness_area_a,wilderness_area_b,wilderness_area_c,wilderness_area_d,';
select_var5 = 'soil_type_aa,soil_type_ab,soil_type_ac,soil_type_ad,soil_type_ae,';
select_var6 = 'soil_type_af,soil_type_ag,soil_type_ah,soil_type_ai,soil_type_aj,';
select_var7 = 'soil_type_ak,soil_type_al,soil_type_am,soil_type_an,soil_type_ao,';
select_var8 = 'soil_type_ap,soil_type_aq,soil_type_ar,soil_type_as,soil_type_at,';
select_var9 = 'soil_type_au,soil_type_av,soil_type_aw,soil_type_ax,soil_type_ay,';
select_var10 = 'soil_type_az,soil_type_ba,soil_type_bb,soil_type_bc,soil_type_bd,';
select_var11 = 'soil_type_be,soil_type_bf,soil_type_bg,soil_type_bh,soil_type_bi,';
select_var12 = 'soil_type_bj,soil_type_bk,soil_type_bl,soil_type_bm,soil_type_bn';
select_var = [select_var1,select_var2,select_var3,select_var4,select_var5,...
    select_var6,select_var7,select_var8,select_var9,select_var10,...
    select_var11,select_var12];
sql = ['SELECT ', select_var,...
    ' FROM uci_database.covertype where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_credit_approval(datasource,username,password,url)

select_var1 = 'class_name,secret_a,secret_b,secret_c,secret_d,secret_e,';
select_var2 = 'secret_f,secret_g,secret_h,secret_i,secret_j,secret_k,';
select_var3 = 'secret_l,secret_m,secret_n,secret_o';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.credit_approval where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data ...
    = list_all_default_of_credit_card_clients(datasource,username,password,url)

select_var1 = 'class_name,limit_bal,sex,education,marriage,age,pay_a,';
select_var2 = 'pay_b,pay_c,pay_d,pay_e,pay_f,bill_amt_a,bill_amt_b,';
select_var3 = 'bill_amt_c,bill_amt_d,bill_amt_e,bill_amt_f,';
select_var4 = 'pay_amt_a,pay_amt_b,pay_amt_c,pay_amt_d,pay_amt_e,pay_amt_f';
select_var = [select_var1,select_var2,select_var3,select_var4];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.default_of_credit_card_clients where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_ecoli(datasource,username,password,url)

select_var1 = 'class_name,sequence_name,mcg,gvh,lip,chg,aac,';
select_var2 = 'alm_a,alm_b';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.ecoli where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_fertility(datasource,username,password,url)

select_var1 = 'class_name,season,childish_diseases,accident,surgical,';
select_var2 = 'alm_a,alm_b';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.fertility where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_glass_identification(datasource,username,password,url)

select_var1 = 'class_name,refractive_index,sodium,magnesium,aluminum,';
select_var2 = 'silicon,potassium,calcium,barium,iron';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.glass_identification where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_haberman_survival(datasource,username,password,url)

select_var1 = 'class_name,age,operation_year,positive_axillary_nodes_number,';
select_var2 = 'silicon,potassium,calcium,barium,iron';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.haberman_survival where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end

function mdl_data = list_all_hayes_roth(datasource,username,password,url)

select_var = 'class_name,name,hobby,age,educational_level,marital_status';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.hayes_roth where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_hepatitis(datasource,username,password,url)

select_var1 = 'class_name,age,sex,steroid,antuvirals,fatigue,malaise,anorexia,';
select_var2 = 'liver_big,liver_firm,spleen_palpable,spiders,ascites,varices,';
select_var3 = 'bilirubin,alk_phoshphate,sgot,albumin,protime,histology';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.hepatitis where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_htru(datasource,username,password,url)

select_var1 = 'class_name,integrated_profile_mean,integrated_profile_standard_deviation,';
select_var2 = 'integrated_profile_excess_kurtosis,integrated_profile_skewness,';
select_var3 = 'curve_mean,curve_standard_deviation,curve_excess_kurtosis,';
select_var4 = 'curve_skewness';
select_var = [select_var1,select_var2,select_var3,select_var4];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.htru where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_iris(datasource,username,password,url)

select_var = 'class_name,sepal_length,sepal_width,petal_length,petal_width';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.iris where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_letter_recognition(datasource,username,password,url)

select_var1 = 'letter,x_box,y_box,width,high,onpix,x_bar,y_bar,x_to_bar,';
select_var2 = 'y_to_bar,xy_bar,x_to_y_br,xy_to_br,x_ege,xegvy,y_ege,yegvx';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.letter_recognition where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_localization_data_for_person_activity(...
    datasource,username,password,url)

select_var1 = 'activity,sequence_name,tag_identificatorm,timestamp,date_format,';
select_var2 = 'x_coordinate_of_the_tag,y_coordinate_of_the_tag,z_coordinate_of_the_tag';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.localization_data_for_person_activity where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_magic_gamma_telescope(datasource,username,password,url)

select_var1 = 'class_name,f_length,f_width,f_size,f_conc,f_conc_a,f_asym,';
select_var2 = 'fm_Long,fm_trans,f_alpha,f_dist';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.magic_gamma_telescope where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_monk_problems(datasource,username,password,url)

select_var = 'class_name,aa,ab,ac,ad,ae,af';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.monk_problems where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_mushroom(datasource,username,password,url)

select_var1 = 'class_name,cap_shape,cap_surface,cap_color,bruises,odor,';
select_var2 = 'gill_attachment,gill_spacing,gill_size,gill_color,';
select_var3 = 'stalk_shape,stalk_root,stalk_surface_above_ring,stalk_surface_below_ring,';
select_var4 = 'stalk_color_above_ring,stalk_color_below_ring,veil_type,veil_color,';
select_var5 = 'ring_number,ring_type,spore_print_color,population,habitat';
select_var = [select_var1,select_var2,select_var3,select_var4,select_var5];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.mushroom where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_nursery(datasource,username,password,url)

select_var1 = 'class_name,parents,has_nurs,form,children,housing,';
select_var2 = 'finance,social,health';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.nursery where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_occupancy(datasource,username,password,url)

select_var = 'occupancy,date,temperature,humidity,light,carbon_dioxide,humidity_ratio';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.occupancy where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end



function mdl_data = list_all_page_blocks(datasource,username,password,url)

select_var1 = 'class_name,height,lenght,area,eccen,p_black,p_and,mean_tr,';
select_var2 = 'blackpix,blackand,wb_trans';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.page_blocks where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_post_operative_patient(datasource,username,password,url)

select_var = 'decision,l_core,l_surf,l_o,l_bp,surf_stbl,core_stbl,bp_stbl,comfort';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.post_operative_patient where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_primary_tumor(datasource,username,password,url)

select_var1 = 'class_name,age,sex,histologic_type,degree_of_diffe,bone,';
select_var2 = 'bone_marrow,lung,pleura,peritoneum,liver,brain,skin,';
select_var3 = 'neck,supraclavicular,axillar,mediastinum,abdominal';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.primary_tumor where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_record_linkage_comparison_patterns(datasource,username,password,url)

select_var1 = 'is_match,id_a,id_b,cmp_fname_ca,cmp_fname_cb,cmp_lname_ca,';
select_var2 = 'cmp_lname_cb,cmp_sex,cmp_bd,cmp_bm,cmp_by,cmp_plz';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.record_linkage_comparison_patterns where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_seeds(datasource,username,password,url)

select_var1 = 'class_name,area,perimeter,compactness,length_of_kernel,';
select_var2 = 'width_of_kernel,asymmetry_coefficient,length_of_kernel_groove';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.seeds where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_skin_segmentation(datasource,username,password,url)

select_var = 'class_name,b,g,r';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.skin_segmentation where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_statlog_australian_credit_approval(datasource,username,password,url)

select_var = 'class_name,aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.statlog_australian_credit_approval where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_statlog_german_credit(datasource,username,password,url)

select_var = 'class_name,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.statlog_german_credit where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_statlog_heart(datasource,username,password,url)

select_var1 = 'class_name,age,sex,chest_pain_type,resting_blood_pressure,serum,';
select_var2 = 'fasting_blood_sugar,resting_electrocardiographic,maximum_heart_rate,';
select_var3 = 'exercise,oldpeak,peak_exercise,major_vessels,thal';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.statlog_heart where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_statlog_landsat_satellite(datasource,username,password,url)

select_var1 = 'class_name,aa,ab,ac,ad,ae,af,ba,bb,bc,bd,be,bf,ca,cb,cc,cd,';
select_var2 = 'ce,cf,da,db,dc,dd,de,df,ea,eb,ec,ed,ee,ef,fa,fb,fc,fd,fe,ff';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.statlog_landsat_satellite where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_statlog_shuttle(datasource,username,password,url)

select_var = 'class_name,a,b,c,d,e,f,g,h,i';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.statlog_shuttle where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_statlog_vehicle_silhouettes(datasource,username,password,url)

select_var1 = 'class_name,compactness,circularity,distance_circularity,radius_ratio,';
select_var2 = 'pr_axis_aspect_ratio,max_length_aspect_ratio,scatter_ratio,';
select_var3 = 'elongatedness,pr_axis_rectangularity,max_length_rectangularity,';
select_var4 = 'scaled_variance,scaled_variance_a,scaled_radius_of_gyration,';
select_var5 = 'skewness_about,skewness_about_a,kurtosis_about,kurtosis_about_a,';
select_var6 = 'hollows_ratio';
select_var = [select_var1,select_var2,select_var3,select_var4,select_var5,select_var6];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.statlog_vehicle_silhouettes where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_susy(datasource,username,password,url)

select_var1 = 'class_name,a_a,a_b,a_c,a_d,a_e,a_f,a_g,a_h,';
select_var2 = 'b_a,b_b,b_c,b_d,b_e,b_f,b_g,b_h,b_i,b_j';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.susy where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_teaching_assistant_evaluation(datasource,username,password,url)

select_var1 = 'class_name,native_english_speaker,course_instructor,course,';
select_var2 = 'semester,class_size';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.teaching_assistant_evaluation where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_tic_tac_toe_endgame(datasource,username,password,url)

select_var = 'class_name,a_a,a_b,a_c,b_a,b_b,b_c,c_a,c_b,c_c';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.tic_tac_toe_endgame where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_user_knowledge_modeling(datasource,username,password,url)

select_var = 'uns,stg,scg,str,lpr,peg';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.user_knowledge_modeling where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_wholesale_customers(datasource,username,password,url)

select_var1 = 'region,fresh,milk,grocery,frozen,detergents_paper,';
select_var2 = 'delicassen,channel';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.wholesale_customers where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_wine(datasource,username,password,url)

select_var1 = 'class_name,alcohol,malic_acid,ash,alcalinity_of_ash,magnesium,';
select_var2 = 'total_phenols,flavanoids,nonflavanoid_phenols,proanthocyanins,';
select_var3 = 'color_intensity,hue,diluted_wines,proline';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.wine where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data = list_all_wine_quality_white(datasource,username,password,url)

select_var1 = 'quality,fixed_acidity,volatile_acidity,citric_acid,residual_sugar,';
select_var2 = 'chlorides,free_sulfur_dioxide,total_sulfur_dioxide,density,';
select_var3 = 'ph,sulphates,alcohol';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.wine_quality_white where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data ...
    = list_all_wireless_indoor_localization(datasource,username,password,url)

select_var1 = 'class_name,wifi_signal_a,wifi_signal_b,wifi_signal_c,';
select_var2 = 'wifi_signal_d,wifi_signal_e,wifi_signal_f';
select_var = [select_var1,select_var2];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.wireless_indoor_localization where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data  = list_all_yeast(datasource,username,password,url)

select_var = 'sequence_name,mcg,gvh,alm,mit,erl,pox,vac,nuc';
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.yeast where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map);
mdl_data = mdl_data';

end


function mdl_data  = list_all_zoo(datasource,username,password,url)

select_var1 = 'type,animal_name,hair,feathers,eggs,milk,airborne,aquatic,';
select_var2 = 'predator,toothed,backbone,breathes,venomous,fins,legs,tail,';
select_var3 = 'domestic,catsize';
select_var = [select_var1,select_var2,select_var3];
sql = ['SELECT ', select_var ,...
    ' FROM uci_database.zoo where status = 1'];

class_index = 1;

% get data from mysql
data = get_data_from_mysql(sql,datasource,username,password,url);

% convert data to num matrix
[data, data_need_convert_map] = convert_to_num_matrix(data);

% use mdl algorithm get data which bnt can used
mdl_data = mdl_algorithm(data,class_index,data_need_convert_map,'fix_data','yes');
mdl_data = mdl_data';

end