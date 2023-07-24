import unittest
from odoo.tests import common

class TestTask(common.TaskCase):
    def test_create_task(self):
        Task = self.env['mytask.create']
        new_Task = Task.create({
            'project': 'aria',
            'Task': 'Task',
            'name': 'test name'

        })
        self.assertEqual(new_Task.project, 'aria')
        self.assertEqual(new_Task.Task, 'Task')
        self.assertEqual(new_Task.name, 'test name')

        Task = self.env['project.create']
        new_Task = Task.create({
            'project': 'aria',
            'Task': 'Task',
            'name': 'test name'

        })
        self.assertEqual(new_Task.project, 'aria')
        self.assertEqual(new_Task.Task, 'Task')
        self.assertEqual(new_Task.name, 'test name')