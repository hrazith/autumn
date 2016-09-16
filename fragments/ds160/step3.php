
<div class="inputbox form-intake shadow hide" id="step3">	
	<form>
		<div class="grid">
			<div class="col-3-4">
				<h2>Birth Information</h2>	
				<ul class="input-list names">
					<li>
						<label for="dob">Date of Birth</label>
						<input type="text" placeholder="Birth Date" name="dob" 
						value="<?php echo isset($cust['Date_Of_Birth']) ? $cust['Date_Of_Birth'] : '' ?>"/>
					</li>
					<li>
						<label for="bcity">City of Birth</label>
						<input type="text" placeholder="Birth City" name="bcity" 
						value="<?php echo isset($cust['City_Of_Birth']) ? $cust['City_Of_Birth'] : '' ?>"/>
					</li>
					<li>
						<label for="bstate">State of Birth</label>
						<input type="text" placeholder="State of Birth" name="bstate" 
						value="<?php echo isset($cust['State_Of_Birth']) ? $cust['State_Of_Birth'] : '' ?>"/>
					</li>
					
				</ul>
			</div>
			
		</div>
	</form>
</div>


		