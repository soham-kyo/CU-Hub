import tkinter as tk
from tkinter import ttk, messagebox
import json
import os
FILE_NAME = "kyotrack_projects.json"
projects = {}
def load_projects():
    global projects
    if os.path.exists(FILE_NAME):
        try:
            with open(FILE_NAME, "r") as file:
                projects = json.load(file)
        except (json.JSONDecodeError, OSError):
            projects = {}
def save_projects():
    try:
        with open(FILE_NAME, "w") as file:
            json.dump(projects, file, indent=4)
    except OSError:
        messagebox.showerror(
            "Storage Error",
            "Unable to save project data."
        )
def clear_fields():
    project_id.delete(0, tk.END)
    project_name.delete(0, tk.END)
    technology.delete(0, tk.END)
    deadline.delete(0, tk.END)
    status.set("Planning")
    priority.set("Medium")
    selected_project.set("")
def refresh_table(data=None):
    for item in project_table.get_children():
        project_table.delete(item)
    source = data if data is not None else projects
    for pid, project in source.items():
        project_table.insert(
            "",
            tk.END,
            values=(
                pid,
                project["name"],
                project["technology"],
                project["status"],
                project["priority"],
                project["deadline"]
            )
        )
    update_count()
def update_count():
    count = len(project_table.get_children())
    project_count.config(
        text=f"PROJECTS: {count}"
    )
def add_project():
    pid = project_id.get().strip()
    name = project_name.get().strip()
    tech = technology.get().strip()
    project_status = status.get()
    project_priority = priority.get()
    due_date = deadline.get().strip()
    if not pid or not name or not tech or not due_date:
        messagebox.showwarning(
            "Missing Information",
            "Please fill all project details."
        )
        return
    if pid in projects:
        messagebox.showerror(
            "Duplicate Project ID",
            "This Project ID already exists."
        )
        return
    projects[pid] = {
        "name": name,
        "technology": tech,
        "status": project_status,
        "priority": project_priority,
        "deadline": due_date
    }
    save_projects()
    refresh_table()
    clear_fields()
    messagebox.showinfo(
        "Project Added",
        f"{name} has been added to KyoTrack."
    )
def select_project(event):
    selected = project_table.selection()
    if not selected:
        return
    values = project_table.item(
        selected[0],
        "values"
    )
    clear_fields()
    project_id.insert(0, values[0])
    project_name.insert(0, values[1])
    technology.insert(0, values[2])
    status.set(values[3])
    priority.set(values[4])
    deadline.insert(0, values[5])
    selected_project.set(values[0])
def update_project():
    pid = selected_project.get()
    if not pid:
        messagebox.showwarning(
            "No Selection",
            "Select a project from the table first."
        )
        return
    if pid not in projects:
        messagebox.showerror(
            "Error",
            "Project not found."
        )
        return
    name = project_name.get().strip()
    tech = technology.get().strip()
    due_date = deadline.get().strip()
    if not name or not tech or not due_date:
        messagebox.showwarning(
            "Missing Information",
            "Please fill all project details."
        )
        return
    projects[pid] = {
        "name": name,
        "technology": tech,
        "status": status.get(),
        "priority": priority.get(),
        "deadline": due_date
    }
    save_projects()
    refresh_table()
    clear_fields()
    messagebox.showinfo(
        "Updated",
        "Project details updated successfully."
    )
def delete_project():
    pid = selected_project.get()
    if not pid:
        messagebox.showwarning(
            "No Selection",
            "Select a project to delete."
        )
        return
    if pid not in projects:
        return
    confirm = messagebox.askyesno(
        "Delete Project",
        f"Delete project '{projects[pid]['name']}'?"
    )
    if confirm:
        del projects[pid]
        save_projects()
        refresh_table()
        clear_fields()
        messagebox.showinfo(
            "Deleted",
            "Project deleted successfully."
        )
def search_projects():
    query = search_box.get().strip().lower()
    if not query:
        refresh_table()
        return
    results = {}
    for pid, project in projects.items():
        searchable_data = [
            pid,
            project["name"],
            project["technology"],
            project["status"],
            project["priority"],
            project["deadline"]
        ]
        if any(
            query in str(value).lower()
            for value in searchable_data
        ):
            results[pid] = project
    refresh_table(results)
root = tk.Tk()
root.title("KyoTrack — Developer Project Tracker")
root.geometry("1050x680")
root.config(
    bg="#0D0D0D"
)
selected_project = tk.StringVar()
status = tk.StringVar(
    value="Planning"
)
priority = tk.StringVar(
    value="Medium"
)
header = tk.Frame(
    root,
    bg="#0D0D0D"
)
header.pack(
    fill="x",
    padx=35,
    pady=(25, 10)
)
title = tk.Label(
    header,
    text="KyoTrack",
    bg="#0D0D0D",
    fg="#A020F0",
    font=("Consolas", 25, "bold")
)
title.pack(anchor="w")
subtitle = tk.Label(
    header,
    text="> Developer Project Management Console",
    bg="#0D0D0D",
    fg="#E0B0FF",
    font=("Consolas", 11)
)
subtitle.pack(anchor="w", pady=4)
form = tk.Frame(
    root,
    bg="#151515",
    bd=1,
    relief="solid"
)
form.pack(
    fill="x",
    padx=35,
    pady=10
)
labels = [
    "PROJECT ID",
    "PROJECT NAME",
    "TECHNOLOGY",
    "STATUS",
    "PRIORITY",
    "DEADLINE"
]
for column, text in enumerate(labels):
    tk.Label(
        form,
        text=text,
        bg="#151515",
        fg="#A020F0",
        font=("Consolas", 9, "bold")
    ).grid(
        row=0,
        column=column,
        padx=8,
        pady=(14, 5)
    )
entry_style = {
    "bg": "#0D0D0D",
    "fg": "#E0B0FF",
    "insertbackground": "#A020F0",
    "font": ("Consolas", 9),
    "bd": 1,
    "relief": "solid"
}
project_id = tk.Entry(
    form,
    width=13,
    **entry_style
)
project_id.grid(
    row=1,
    column=0,
    padx=8,
    pady=(0, 15)
)
project_name = tk.Entry(
    form,
    width=18,
    **entry_style
)
project_name.grid(
    row=1,
    column=1,
    padx=8,
    pady=(0, 15)
)
technology = tk.Entry(
    form,
    width=18,
    **entry_style
)
technology.grid(
    row=1,
    column=2,
    padx=8,
    pady=(0, 15)
)
status_box = ttk.Combobox(
    form,
    textvariable=status,
    values=[
        "Planning",
        "In Progress",
        "Completed",
        "On Hold"
    ],
    width=14,
    state="readonly"
)
status_box.grid(
    row=1,
    column=3,
    padx=8,
    pady=(0, 15)
)
priority_box = ttk.Combobox(
    form,
    textvariable=priority,
    values=[
        "Low",
        "Medium",
        "High",
        "Critical"
    ],
    width=12,
    state="readonly"
)
priority_box.grid(
    row=1,
    column=4,
    padx=8,
    pady=(0, 15)
)
deadline = tk.Entry(
    form,
    width=14,
    **entry_style
)
deadline.grid(
    row=1,
    column=5,
    padx=8,
    pady=(0, 15)
)
button_frame = tk.Frame(
    root,
    bg="#0D0D0D"
)
button_frame.pack(
    fill="x",
    padx=35,
    pady=8
)
def make_button(text, command):
    return tk.Button(
        button_frame,
        text=text,
        command=command,
        bg="#1A1A1A",
        fg="#A020F0",
        activebackground="#A020F0",
        activeforeground="black",
        font=("Consolas", 9, "bold"),
        padx=14,
        pady=7,
        bd=1,
        relief="solid",
        cursor="hand2"
    )
make_button(
    "[ ADD PROJECT ]",
    add_project
).pack(side="left", padx=4)
make_button(
    "[ UPDATE ]",
    update_project
).pack(side="left", padx=4)
make_button(
    "[ DELETE ]",
    delete_project
).pack(side="left", padx=4)
make_button(
    "[ CLEAR ]",
    clear_fields
).pack(side="left", padx=4)
search_frame = tk.Frame(
    root,
    bg="#0D0D0D"
)
search_frame.pack(
    fill="x",
    padx=35,
    pady=(10, 5)
)
tk.Label(
    search_frame,
    text="SEARCH >",
    bg="#0D0D0D",
    fg="#A020F0",
    font=("Consolas", 10, "bold")
).pack(side="left")
search_box = tk.Entry(
    search_frame,
    width=35,
    **entry_style
)
search_box.pack(
    side="left",
    padx=10
)
make_button(
    "[ SEARCH ]",
    search_projects
).pack(side="left")
project_count = tk.Label(
    search_frame,
    text="PROJECTS: 0",
    bg="#0D0D0D",
    fg="#E0B0FF",
    font=("Consolas", 9)
)
project_count.pack(
    side="right"
)
table_frame = tk.Frame(
    root,
    bg="#0D0D0D"
)
table_frame.pack(
    fill="both",
    expand=True,
    padx=35,
    pady=10
)
style = ttk.Style()
style.theme_use("default")
style.configure(
    "Treeview",
    background="#151515",
    foreground="#E0B0FF",
    fieldbackground="#151515",
    font=("Consolas", 9),
    rowheight=30,
    borderwidth=0
)
style.configure(
    "Treeview.Heading",
    background="#A020F0",
    foreground="black",
    font=("Consolas", 9, "bold")
)
style.map(
    "Treeview",
    background=[
        ("selected", "#6A0DAD")
    ],
    foreground=[
        ("selected", "white")
    ]
)
columns = (
    "ID",
    "Name",
    "Technology",
    "Status",
    "Priority",
    "Deadline"
)
project_table = ttk.Treeview(
    table_frame,
    columns=columns,
    show="headings"
)
widths = {
    "ID": 90,
    "Name": 190,
    "Technology": 180,
    "Status": 130,
    "Priority": 110,
    "Deadline": 120
}
for column in columns:
    project_table.heading(
        column,
        text=column
    )
    project_table.column(
        column,
        width=widths[column],
        anchor="center"
    )
project_table.pack(
    fill="both",
    expand=True
)
project_table.bind(
    "<ButtonRelease-1>",
    select_project
)
load_projects()
refresh_table()
root.mainloop()