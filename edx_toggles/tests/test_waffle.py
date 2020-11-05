"""
Unit tests for waffle classes.
"""

from django.test import TestCase
# TODO import from edx_toggles.toggles once we remove the legacy classes from the exposed API
from edx_toggles.toggles.internal.waffle.flag import WaffleFlag
from edx_toggles.toggles.internal.waffle.switch import WaffleSwitch


class WaffleFlagTests(TestCase):
    """
    WaffleFlag tests.
    """

    def test_name_validation(self):
        WaffleFlag("namespaced.name", module_name="module1")
        self.assertRaises(
            ValueError, WaffleFlag, "non_namespaced", module_name="module1"
        )


class WaffleSwitchTest(TestCase):
    """
    WaffleSwitch tests.
    """

    def test_name_validation(self):
        WaffleSwitch("namespaced.name", module_name="module1")
        self.assertRaises(
            ValueError, WaffleSwitch, "non_namespaced", module_name="module1"
        )

    def test_constructor(self):
        switch = WaffleSwitch("namespaced.name", module_name="module1")
        self.assertEqual("module1", switch.module_name)
