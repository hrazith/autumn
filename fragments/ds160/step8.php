
<div class="inputbox form-intake shadow hide" id="step8">	
	<form>
		<div class="grid">
			<div class="col-1-4">
				<label for="smaddress">Same mailing address?</label>
				<ul class="input-list">
					<li>
						<input type="radio" name="smaddress" value="yes" 
						<?php echo($cust['Same_Mailing_Address']=='yes')?'checked':'' ?>> Yes
					</li>
					<li>
						<input type="radio" name="smaddress" value="no" 
						<?php echo($cust['Same_Mailing_Address']=='no')?'checked':'' ?>> No
					</li>
				</ul>
			</div>
			<div class="col-3-4">
				<h2>Mailing address</h2>	
				<label for="smaddress">Mailing address</label>
				<ul class="input-list">
					<li>
						<input type="text" placeholder="mailing address" name="maddress" 
						value="<?php echo isset($cust['Mailing_Home_Address']) ? $cust['Mailing_Home_Address'] : '' ?>"/>
					</li>
					<li>
						<label for="mcity">City</label>
						<input type="text" placeholder="City" name="mcity" 
						value="<?php echo isset($cust['Mailing_City']) ? $cust['Mailing_City'] : '' ?>"/>
					</li>
					<li>
						<label for="mstate">State or Province</label>
						<input type="text" placeholder="State or Province" name="mstate" 
						value="<?php echo isset($cust['Mailing_State_Province']) ? $cust['Mailing_State_Province'] : '' ?>"/>
					</li>
					<li>
						<label for="mzip">Zip</label>
						<input type="text" placeholder="Postal or Zip Code" name="mzip" 
						value="<?php echo isset($cust['Mailing_PostalZone_ZIPCode']) ? $cust['Mailing_PostalZone_ZIPCode'] : '' ?>"/>
					</li>
					<li>
						<label for="mcountry">Country</label>
						<div class="select">	
							<select name="mcountry" id="mcountry">
							<option>Choose...</option>
							<option data-code='AF' >Afghanistan</option><option data-code='AL' >Albania</option><option data-code='DZ' >Algeria</option><option data-code='AS' >American Samoa</option><option data-code='AD' >Andorra</option><option data-code='AO' >Angola</option><option data-code='AI' >Anguilla</option><option data-code='AQ' >Antarctica</option><option data-code='AG' >Antigua and Barbuda</option><option data-code='AR' >Argentina</option><option data-code='AM' >Armenia</option><option data-code='AW' >Aruba</option><option data-code='AU' >Australia</option><option data-code='AT' >Austria</option><option data-code='AZ' >Azerbaijan</option><option data-code='BS' >Bahamas</option><option data-code='BH' >Bahrain</option><option data-code='BD' >Bangladesh</option><option data-code='BB' >Barbados</option><option data-code='BY' >Belarus</option><option data-code='BE' >Belgium</option><option data-code='BZ' >Belize</option><option data-code='BJ' >Benin</option><option data-code='BM' >Bermuda</option><option data-code='BT' >Bhutan</option><option data-code='BO' >Bolivia</option><option data-code='BA' >Bosnia and Herzegovina</option><option data-code='BW' >Botswana</option><option data-code='BV' >Bouvet Island</option><option data-code='BR' >Brazil</option><option data-code='IO' >British Indian Ocean Territory</option><option data-code='BN' >Brunei</option><option data-code='BG' >Bulgaria</option><option data-code='BF' >Burkina Faso</option><option data-code='BI' >Burundi</option><option data-code='KH' >Cambodia</option><option data-code='CM' >Cameroon</option><option data-code='CA' >Canada</option><option data-code='CV' >Cape Verde</option><option data-code='KY' >Cayman Islands</option><option data-code='CF' >Central African Republic</option><option data-code='TD' >Chad</option><option data-code='CL' >Chile</option><option data-code='CN' >China</option><option data-code='CX' >Christmas Island</option><option data-code='CC' >Cocos (Keeling) Islands</option><option data-code='CO' >Colombia</option><option data-code='KM' >Comoros</option><option data-code='CG' >Congo</option><option data-code='CK' >Cook Islands</option><option data-code='CR' >Costa Rica</option><option data-code='CI' >Cote D'Ivoire (Ivory Coast)</option><option data-code='HR' >Croatia (Hrvatska)</option><option data-code='CU' >Cuba</option><option data-code='CY' >Cyprus</option><option data-code='CZ' >Czech Republic</option><option data-code='DK' >Denmark</option><option data-code='DJ' >Djibouti</option><option data-code='DM' >Dominica</option><option data-code='DO' >Dominican Republic</option><option data-code='TP' >East Timor</option><option data-code='EC' >Ecuador</option><option data-code='EG' >Egypt</option><option data-code='SV' >El Salvador</option><option data-code='GQ' >Equatorial Guinea</option><option data-code='ER' >Eritrea</option><option data-code='EE' >Estonia</option><option data-code='ET' >Ethiopia</option><option data-code='FK' >Falkland Islands (Malvinas)</option><option data-code='FO' >Faroe Islands</option><option data-code='FJ' >Fiji</option><option data-code='FI' >Finland</option><option data-code='FR' >France</option><option data-code='GF' >French Guiana</option><option data-code='PF' >French Polynesia</option><option data-code='TF' >French Southern Territories</option><option data-code='GA' >Gabon</option><option data-code='GM' >Gambia</option><option data-code='GE' >Georgia</option><option data-code='DE' >Germany</option><option data-code='GH' >Ghana</option><option data-code='GI' >Gibraltar</option><option data-code='GB' >Great Britain (UK)</option><option data-code='GR' >Greece</option><option data-code='GL' >Greenland</option><option data-code='GD' >Grenada</option><option data-code='GP' >Guadeloupe</option><option data-code='GU' >Guam</option><option data-code='GT' >Guatemala</option><option data-code='GN' >Guinea</option><option data-code='GW' >Guinea-Bissau</option><option data-code='GY' >Guyana</option><option data-code='HT' >Haiti</option><option data-code='HM' >Heard and McDonald Islands</option><option data-code='HN' >Honduras</option><option data-code='HK' >Hong Kong</option><option data-code='HU' >Hungary</option><option data-code='IS' >Iceland</option><option data-code='IN' >India</option><option data-code='ID' >Indonesia</option><option data-code='IR' >Iran</option><option data-code='IQ' >Iraq</option><option data-code='IE' >Ireland</option><option data-code='IL' >Israel</option><option data-code='IT' >Italy</option><option data-code='JM' >Jamaica</option><option data-code='JP' >Japan</option><option data-code='JO' >Jordan</option><option data-code='KZ' >Kazakhstan</option><option data-code='KE' >Kenya</option><option data-code='KI' >Kiribati</option><option data-code='KW' >Kuwait</option><option data-code='KG' >Kyrgyzstan</option><option data-code='LA' >Laos</option><option data-code='LV' >Latvia</option><option data-code='LB' >Lebanon</option><option data-code='LS' >Lesotho</option><option data-code='LR' >Liberia</option><option data-code='LY' >Libya</option><option data-code='LI' >Liechtenstein</option><option data-code='LT' >Lithuania</option><option data-code='LU' >Luxembourg</option><option data-code='MO' >Macau</option><option data-code='MK' >Macedonia</option><option data-code='MG' >Madagascar</option><option data-code='MW' >Malawi</option><option data-code='MY' >Malaysia</option><option data-code='MV' >Maldives</option><option data-code='ML' >Mali</option><option data-code='MT' >Malta</option><option data-code='MH' >Marshall Islands</option><option data-code='MQ' >Martinique</option><option data-code='MR' >Mauritania</option><option data-code='MU' >Mauritius</option><option data-code='YT' >Mayotte</option><option data-code='MX' >Mexico</option><option data-code='FM' >Micronesia</option><option data-code='MD' >Moldova</option><option data-code='MC' >Monaco</option><option data-code='MN' >Mongolia</option><option data-code='MS' >Montserrat</option><option data-code='MA' >Morocco</option><option data-code='MZ' >Mozambique</option><option data-code='MM' >Myanmar</option><option data-code='NA' >Namibia</option><option data-code='NR' >Nauru</option><option data-code='NP' >Nepal</option><option data-code='NL' >Netherlands</option><option data-code='AN' >Netherlands Antilles</option><option data-code='NT' >Neutral Zone</option><option data-code='NC' >New Caledonia</option><option data-code='NZ' >New Zealand (Aotearoa)</option><option data-code='NI' >Nicaragua</option><option data-code='NE' >Niger</option><option data-code='NG' >Nigeria</option><option data-code='NU' >Niue</option><option data-code='NF' >Norfolk Island</option><option data-code='KP' >North Korea</option><option data-code='MP' >Northern Mariana Islands</option><option data-code='NO' >Norway</option><option data-code='OM' >Oman</option><option data-code='PK' >Pakistan</option><option data-code='PW' >Palau</option><option data-code='PA' >Panama</option><option data-code='PG' >Papua New Guinea</option><option data-code='PY' >Paraguay</option><option data-code='PE' >Peru</option><option data-code='PH' >Philippines</option><option data-code='PN' >Pitcairn</option><option data-code='PL' >Poland</option><option data-code='PT' >Portugal</option><option data-code='PR' >Puerto Rico</option><option data-code='QA' >Qatar</option><option data-code='RE' >Reunion</option><option data-code='RO' >Romania</option><option data-code='RU' >Russia</option><option data-code='RW' >Rwanda</option><option data-code='KN' >Saint Kitts and Nevis</option><option data-code='LC' >Saint Lucia</option><option data-code='VC' >Saint Vincent and the Grenadines</option><option data-code='WS' >Samoa</option><option data-code='SM' >San Marino</option><option data-code='ST' >Sao Tome and Principe</option><option data-code='SA' >Saudi Arabia</option><option data-code='SN' >Senegal</option><option data-code='SC' >Seychelles</option><option data-code='SL' >Sierra Leone</option><option data-code='SG' >Singapore</option><option data-code='SK' >Slovak Republic</option><option data-code='SI' >Slovenia</option><option data-code='Sb' >Solomon Islands</option><option data-code='SO' >Somalia</option><option data-code='ZA' >South Africa</option><option data-code='GS' >South Georgia and South Sandwich Islands </option><option data-code='KR' >South Korea</option><option data-code='ES' >Spain</option><option data-code='LK' >Sri Lanka</option><option data-code='SH' >St. Helena</option><option data-code='PM' >St. Pierre and Miquelon</option><option data-code='SD' >Sudan</option><option data-code='SR' >Suriname</option><option data-code='SJ' >Svalbard and Jan Mayen Islands</option><option data-code='SZ' >Swaziland</option><option data-code='SE' >Sweden</option><option data-code='CH' >Switzerland</option><option data-code='SY' >Syria</option><option data-code='TW' >Taiwan</option><option data-code='TJ' >Tajikistan</option><option data-code='TZ' >Tanzania</option><option data-code='TH' >Thailand</option><option data-code='TG' >Togo</option><option data-code='TK' >Tokelau</option><option data-code='TO' >Tonga</option><option data-code='TT' >Trinidad and Tobago</option><option data-code='TN' >Tunisia</option><option data-code='TR' >Turkey</option><option data-code='TM' >Turkmenistan</option><option data-code='TC' >Turks and Caicos Islands</option><option data-code='TV' >Tuvalu</option><option data-code='UG' >Uganda</option><option data-code='UA' >Ukraine</option><option data-code='AE' >United Arab Emirates</option><option data-code='UK' >United Kingdom</option><option data-code='US' >United States</option><option data-code='UY' >Uruguay</option><option data-code='UM' >US Minor Outlying Islands</option><option data-code='UZ' >Uzbekistan</option><option data-code='VU' >Vanuatu</option><option data-code='VA' >Vatican City State (Holy See)</option><option data-code='VE' >Venezuela</option><option data-code='VN' >Vietnam</option><option data-code='VG' >Virgin Islands (British)</option><option data-code='VI' >Virgin Islands (U.S.)</option><option data-code='WF' >Wallis and Futuna Islands</option><option data-code='EH' >Western Sahara</option><option data-code='YE' >Yemen</option><option data-code='YU' >Yugoslavia</option><option data-code='ZR' >Zaire</option><option data-code='ZM' >Zambia</option><option data-code='ZW' >Zimbabwe</option>
							</select>
						</div>
					</li>
					
				</ul>

			</div>
			
		</div>
	</form>
</div>
<script type="text/javascript">
	$("#mcountry").val('<?php echo isset($cust['Mailing_Country']) ? $cust['Mailing_Country'] : 'Choose...';?>');
</script>


		