import json
import datetime

import database


def jsondump(execution, cursor=database.get().cursor()):
    keys = [tuple[0] for tuple in cursor.description]

    output = []

    for row in execution:
        row_dict = {}

        for i in range(len(row)):
            var = row[i]

            # Convert object instances to strings
            if isinstance(row[i], datetime.date):
                var = var.strftime("%Y-%m-%d %H:%M:%S")

            row_dict[keys[i]] = var

        output.append(row_dict)

    return json.dumps(output)
