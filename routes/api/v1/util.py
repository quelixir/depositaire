import json
import database


def jsondump(result, cursor=database.get().cursor()):
    keys = [tuple[0] for tuple in cursor.description]

    output = []

    for row in result:
        row_dict = {}

        for i in range(len(row)):
            row_dict[keys[i]] = row[i]

        output.append(row_dict)

    return json.dumps(output)
