package com.example;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class CalculatorTest {

    Calculator calc = new Calculator();

    @Test
    public void testAddition() {
        assertEquals(5, calc.add(2,3));
    }

    @Test
    public void testSubtraction() {
        assertEquals(3, calc.subtract(5,2));
    }

    @Test
    public void testMultiplication() {
        assertEquals(12, calc.multiply(3,4));
    }

    @Test
    public void testDivision() {
        assertEquals(2, calc.divide(10,5));
    }
}
