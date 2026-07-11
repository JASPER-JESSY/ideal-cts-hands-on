package com.example;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class AAATest {

    private Calculator calc;

    @Before
    public void setUp() {
        System.out.println("Setting up...");
        calc = new Calculator();
    }

    @After
    public void tearDown() {
        System.out.println("Cleaning up...");
        calc = null;
    }

    @Test
    public void testAdditionAAA() {

        // Arrange
        int a = 10;
        int b = 20;

        // Act
        int result = calc.add(a, b);

        // Assert
        assertEquals(30, result);
    }

    @Test
    public void testSubtractionAAA() {

        // Arrange
        int a = 15;
        int b = 5;

        // Act
        int result = calc.subtract(a, b);

        // Assert
        assertEquals(10, result);
    }
}
