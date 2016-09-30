
<div class="inputbox form-intake shadow hide" id="step10">	
	<form>
		<div class="grid">
			
			<div class="col-3-4">
				<h2>Passport Information</h2>	
				<ul class="input-list">
					<li>
						<label for="pptnumber">Passport Number </label>
						<input type="text" placeholder="Passport Number"" name="pptnumber" 
						value="<?php echo isset($cust['Passport_Number']) ? $cust['Passport_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="pptbook">Passport Book </label>
						<input type="text" placeholder="Passport Number"" name="pptbook" 
						value="<?php echo isset($cust['Passport_Book_Number']) ? $cust['Passport_Book_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="pptissue">Passport Issue </label>
						<input type="text" placeholder="Passport Issuing Country"" name="pptissue" 
						value="<?php echo isset($cust['Country_Authority_Issued_Passport']) ? $cust['Country_Authority_Issued_Passport'] : '' ?>"/>
					</li>
					<li>
						<label for="pptcity">Passport Issue City </label>
						<input type="text" placeholder="Passport Issue City"" name="pptcity" 
						value="<?php echo isset($cust['City_Issued_Passport']) ? $cust['City_Issued_Passport'] : '' ?>"/>
					</li>
					
					
					
				</ul>

			</div>
			
		</div>
	</form>
</div>


		