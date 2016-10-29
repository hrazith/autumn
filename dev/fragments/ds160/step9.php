
<div class="inputbox qStep shadow hide" id="step9">	
	<form>
		<div class="grid">
			
			<div class="col-3-4">
				<h2>Phone numbers</h2>	
				<ul class="input-list">
					<li>
						<label for="homephone">Home Phone</label>
						<input type="text" placeholder="home phone" name="homephone" 
						value="<?php echo isset($cust['Home_Phone_Number']) ? $cust['Home_Phone_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="workphone">Work Phone</label>
						<input type="text" placeholder="work phone" name="workphone" 
						value="<?php echo isset($cust['Work_Phone_Number']) ? $cust['Work_Phone_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="fax">Fax</label>
						<input type="text" placeholder="Fax" name="fax" 
						value="<?php echo isset($cust['Work_Fax_Number']) ? $cust['Work_Fax_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="cell">Mobile number</label>
						<input type="text" placeholder="Mobile number" name="cell" 
						value="<?php echo isset($cust['Mobile_Cell_Phone_Number']) ? $cust['Mobile_Cell_Phone_Number'] : '' ?>"/>
					</li>
					<li>
						<label for="email">Email</label>
						<input type="text" placeholder="Email" name="email" 
						value="<?php echo isset($cust['Email_Address']) ? $cust['Email_Address'] : '' ?>"/>
					</li>
					
					
				</ul>

			</div>
			
		</div>
	</form>
</div>


		