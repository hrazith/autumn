
<div class="inputbox qStep shadow hide" id="step5">	
	<form>
		<div class="grid">
			<div class="col-3-4">
				<h2>Birth Information</h2>	
				<ul class="input-list names">
					<li>
						<label for="nid">National Identification Number</label>
						<input type="text" placeholder="National ID Number" name="nid" 
						value="<?php echo isset($cust['National_Identification_Number']) ? $cust['National_Identification_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="ssn">US Social Security Number</label>
						<input type="text" placeholder="US Social Security Number" name="ssn" 
						value="<?php echo isset($cust['US_Social_Security_Number']) ? $cust['US_Social_Security_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="bcity">US Tax ID</label>
						<input type="text" placeholder="US Tax ID" name="taxid" 
						value="<?php echo isset($cust['US_Taxpayer_ID_Number']) ? $cust['US_Taxpayer_ID_Number'] : '' ?>"/>
					</li>
					
					
				</ul>
			</div>
			
		</div>
	</form>
</div>


		