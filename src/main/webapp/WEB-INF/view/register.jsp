<div class=" w3l-login-form" style="max-width: 500px; margin-top: 6%;">
    <h2 class="fit-content center">Register</h2>
    <form method="POST">
        <!--name field-->
        <div class=" w3l-form-group">
            <div class="group">
                <i class="material-icons icon">face</i>
                <input id="id_firstName" type="text" placeholder="First name" name="firstName"
                       {% if firstName %}value="{{ firstName }}"{% endif %} required/>
                <input id="id_lastName" type="text" placeholder="Last name" name="lastName"
                       {% if lastName %}value="{{ lastName }}"{% endif %}/>
            </div>
        </div>

        <!--email field-->
        <div class=" w3l-form-group">
            <div class="group">
                <i class="material-icons icon">email</i>
                <input id="id_email" type="text" placeholder="E-Mail" name="email"
                       {% if email %}value="{{ email }}"{% endif %} required/>
            </div>
        </div>

        <hr>

        <!--username field-->
        <div class=" w3l-form-group">
            <div class="group">
                <i class="material-icons icon">account_circle</i>
                <input id="id_username" type="text" placeholder="Username" name="username"
                       {% if username %}value="{{ username }}"{% endif %} required/>
            </div>
        </div>

        <!--password field-->
        <div class=" w3l-form-group">
            <div class="group">
                <i class="material-icons icon">lock_open</i>
                <input id="id_password" type="password" placeholder="Password" name="password"
                       {% if password %}value="{{ password }}"{% endif %} required/>
            </div>
        </div>

        <!--password re-enter field-->
        <div class=" w3l-form-group">
            <div class="group">
                <i class="material-icons icon">lock_open</i>
                <input id="id_password2" type="password" placeholder="Re-enter Password" name="password2" required/>
            </div>
        </div>
        <button class="button button2" type="submit">Register</button>
    </form>
</div>