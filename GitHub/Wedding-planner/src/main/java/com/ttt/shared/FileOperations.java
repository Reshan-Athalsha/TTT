package com.ttt.shared;

/**
 * ============================================================
 * OOP PRINCIPLE: ABSTRACTION (INTERFACE)
 * ============================================================
 * Shared contract across all TTT components.
 * Any class implementing this MUST provide toFileString().
 */
public interface FileOperations {
    String toFileString();
}
