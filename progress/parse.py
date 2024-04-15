#!/usr/bin/python3

import json
import numpy as np
import pandas as pd

import atom
import google_serve as gs


def set_rubicon(value):
    if value < 0. or 1. < value:
        raise Warning(f"rubicon must be in [0, 1], but got {value}")
    atom.rubicon = value


def numcol(table):
    num = "\\makebox[0.6em][r]{{{}}}"
    return [(r"\darkrow" if int(x) % 2 == 1 else "") + num.format(x)
            for x in table.index.values]


def filter_score(score):
    """Leave results only when the maximum value (the first one) is set"""
    t_max = score[0]
    return score.transform(lambda x: t_max if x > t_max else x)


def print_main(table):
    print(r"""\par\noindent
    \begin{tabular}{r l l cccc c l cc}
    \toprule
    & && \multicolumn{5}{c}{контрольно-проверочные мероприятия} \\
    \makebox[0.6em][r]{№} & Фамилия Имя Отчество && \multicolumn{4}{c}{\task{1}} & \task{2} && \multicolumn{2}{c}{зачёт} \\
    \cline{4-7}\cline{10-11}
    \Hi & && ЛЭ & КА & МТ & ММ & && \(\star\) & отметка \\
    \midrule
    """)
    table.columns = [item.strip() for item in table.columns]
    table = table.transform(lambda col: [x.strip() if type(x) == str else x for x in col])

    columns = [
        "name", "|",
        "task 1: logic elements",
        "task 1: finite automata",
        "task 1: turing machine",
        "task 1: markov machine",
        "task 2",
        "|", "bonus", "mark"
    ]
    m = pd.DataFrame(index=table.index.values, columns=columns)

    # filter table
    table = table[[item for item in table.columns if item in columns]]

    m["name"] = table["name"].transform(atom.name)

    q = pd.DataFrame(index=table.index.values)

    for name in [item for item in table if item.startswith("task")]:
        m[name] = table[name].transform(lambda x: atom.task(x)[1])
        q[name] = table[name].transform(lambda x: atom.task(x)[0])
        q[name] = filter_score(q[name])

    if "bonus" in table:
        m["bonus"] = table["bonus"].transform(lambda x: atom.bonus(x))

    if "mark" in table:
        m["mark"] = table["mark"].transform(lambda x: atom.exam_mark(x))

    m.insert(0, "#", numcol(m))

    tex = m.apply(lambda col: " & ".join([str(x) if x is not np.nan
                                          else "" for x in col]) + r"\\",
                  axis=1).values[1:]

    print("\n".join(tex))

    print(r"""
    \bottomrule
    \end{tabular}
    """)


def read_json(file):
    with file.open("r", encoding="utf-8") as f:
        buf = f.read()
    return json.loads(buf)


def read_table(gc, url):
    """Read table from Google Sheet with `url` using credentials `gc`"""
    wsht = gs.open_worksheet(gc, url)
    vals = wsht.get_all_values()
    return wsht.title, pd.DataFrame(data=vals[1:], columns=vals[0])


if __name__ == "__main__":
    pass
