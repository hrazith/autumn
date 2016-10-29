
<div class="inputbox qStep shadow hide" id="step11">	
	<form>
		<div class="grid">
			
			<div class="col-3-4">
				<h2>Passport Information</h2>	
				<ul class="input-list">
					<li>
						<label for="pptstate">Passport State </label>
						<input type="text" placeholder="Passport State" name="pptstate" 
						value="<?php echo isset($cust['State_Province_Issued_Passport']) ? $cust['State_Province_Issued_Passport'] : '' ?>"/>
					</li>
					<li>
						<label for="pptcountry">Passport Country </label>
						<input type="text" placeholder="Passport Country" name="pptcountry" 
						value="<?php echo isset($cust['Country_Issued_Passport']) ? $cust['Country_Issued_Passport'] : '' ?>"/>
					</li>
					<li>
						<label for="pptissdate">Passport Issue date</label>
						<input type="text" placeholder="Passport Isse Date" name="pptissdate" 
						value="<?php echo isset($cust['Issuance_Date_Passport']) ? $cust['Issuance_Date_Passport'] : '' ?>"/>
					</li>
					<li>
						<label for="pptexpdate">Passport Expiry Date </label>
						<input type="text" placeholder="Passport Expiry City" name="pptexpdate" 
						value="<?php echo isset($cust['Expiration_Date_Passport']) ? $cust['Expiration_Date_Passport'] : '' ?>"/>
					</li>
					<li>
						<label for="pptstolen">Passport Stolen </label>
						
					</li>
					
					
					
				</ul>

			</div>
			
		</div>
	</form>
</div>


		