<table>
    <tr>
        <th>Toggle Name</th>
        {% if show_state %}
            <th>Status*</th>
            <th>Everyone</th>
            <th>Percent</th>
            <th>Tests</th>
            <th>Superusers</th>
            <th>Staff</th>
            <th>Authenticated users</th>
            <th>Users</th>
            <th>Groups</th>
            <th>Languages</th>
            <th>First modified</th>
            <th>Last modified</th>
        {% endif %}
        <th>Description</th>
        <th>Category</th>
        <th>Use Cases</th>
        <th>Implementation</th>
        <th>Creation date</th>
        <th>Expiration date</th>
    </tr>
    {% for toggle in ida.toggles['WaffleFlag'] %}
        {% if toggle.state_msg == 'On' and show_state%}
            <tr style="background-color:#C3FDB8;">
        {% elif toggle.state_msg == 'Off' and show_state %}
            <tr style="background-color:#FF4C4C;">
        {% else %}
            <tr>
        {% endif %}
            <td>{{ toggle.name }}</td>
            {% if show_state %}
                <td>{{ toggle.state_msg }}</td>
                <td>{{ toggle.data_for_template('state', 'everyone') }}</td>
                <td>{{ toggle.data_for_template('state', 'percent') }}</td>
                <td>{{ toggle.data_for_template('state', 'testing') }}</td>
                <td>{{ toggle.data_for_template('state', 'superusers') }}</td>
                <td>{{ toggle.data_for_template('state', 'staff') }}</td>
                <td>{{ toggle.data_for_template('state', 'authenticated') }}</td>
                <td>{{ toggle.data_for_template('state', 'users') }}</td>
                <td>{{ toggle.data_for_template('state', 'groups') }}</td>
                <td>
                    {% if toggle.data_for_template('state', 'languages') == '-' %}
                        -
                    {% else %}
                        <ul>
                            {% for lang in toggle.data_for_template('state', 'languages') %}
                                <li>{{ lang }}</li>
                            {% endfor %}
                        </ul>
                    {% endif %}
                </td>
                <td>{{ toggle.data_for_template('state', 'created') }}</td>
                <td>{{ toggle.data_for_template('state', 'modified') }}</td>
            {% endif %}
            <td>{{ toggle.data_for_template('annotation', 'description') }}</td>
            <td>{{ toggle.data_for_template('annotation', 'category') }}</td>
            <td>
                {% if toggle.data_for_template('annotation', 'use_cases') == '-' %}
                    -
                {% else %}
                    <ul>
                        {% for use_case in toggle.data_for_template('annotation', 'use_cases') %}
                            <li>{{ use_case }}</li>
                        {% endfor %}
                    </ul>
                {% endif %}
            </td>
            <td>{{ toggle.data_for_template('annotation', 'implementation') }}</td>
            <td>{{ toggle.data_for_template('annotation', 'creation_date') }}</td>
            <td>{{ toggle.data_for_template('annotation', 'expiration_date') }}</td>
        </tr>
    {% endfor %}
</table>
<p>
* The 'Status' of a waffle flag is computed by combining the state
of the following flag components: everyone, percent, testing
superusers, staff, authenticated, languages
</p>
