import { format } from 'https://esm.sh/sql-formatter';

const [sql] = Deno.args;

console.log(format(sql, { indent: '    ' }));
