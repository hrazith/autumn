
<div class="inputbox qStep shadow hide" id="step6">	
	<form>
		<div class="grid">
			<div class="col-3-4">
				<h2>Address</h2>	
				<ul class="input-list names">
					<li>
						<label for="nid">Home Street Address</label>
						<input type="text" placeholder="National ID Number" name="address" 
						value="<?php echo isset($cust['Home_Address']) ? $cust['Home_Address'] : '' ?>"/>
					</li>
					<li>
						<label for="ssn">City</label>
						<input type="text" placeholder="City" name="city" 
						value="<?php echo isset($cust['City']) ? $cust['City'] : '' ?>"/>
					</li>
					
					
				</ul>
			</div>
			
		</div>
	</form>
</div>


		