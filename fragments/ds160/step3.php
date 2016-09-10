
<div class="inputbox form-intake shadow hide" id="step3">	
	<form>
		<div class="grid">
			<div class="col-3-4">
				<h2>Names</h2>	
				<ul class="input-list names">
					<li>
						<input type="text" placeholder="Birth Date" name="dob" 
						value="<?php echo isset($cust['Date_Of_Birth']) ? $cust['Date_Of_Birth'] : '' ?>"/>
					</li>
					<li>
						<input type="text" placeholder="Birth City" name="bcity" 
						value="<?php echo isset($cust['City_Of_Birth']) ? $cust['City_Of_Birth'] : '' ?>"/>
					</li>
					<li>
						<input type="text" placeholder="State of Birth" name="nname" 
						value="<?php echo isset($cust['State_Of_Birth']) ? $cust['State_Of_Birth'] : '' ?>"/>
					</li>
					<li>
						<input type="text" placeholder="Nationality" name="nationality" 
						value="<?php echo isset($cust['nationality']) ? $cust['nationality'] : '' ?>"/>
					</li>
					<li>
						<input type="text" placeholder="Nationality" name="nationality" 
						value="<?php echo isset($cust['nationality']) ? $cust['nationality'] : '' ?>"/>
					</li>
					
				</ul>
			</div>
			
		</div>
	</form>
</div>


		