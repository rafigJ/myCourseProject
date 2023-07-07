package ru.javawebinar.basejava.storage;

import ru.javawebinar.basejava.model.Resume;

import java.util.Arrays;

/**
 * Array based storage for Resumes
 */
public class ArrayStorage extends AbstractArrayStorage {

    @Override
    protected void saveArrayStorage(Resume r, int index) {
        storage[size] = r;
    }

    @Override
    protected void deleteArrayStorage(int index) {
        storage[index] = storage[size - 1];
    }

    @Override
    protected Integer getSearchKey(String uuid) {
        for (int i = 0; i < size; i++) {
            if (storage[i].getUuid().equals(uuid)) {
                return i;
            }
        }
        return -1;
    }

    @Override
    protected void sortingTempStorage(Resume[] tempStorage) {
        Arrays.sort(tempStorage, (r1, r2) -> {
            int nameCompared = r1.getFullName().compareTo(r2.getFullName());
            int uuidCompared = r1.getUuid().compareTo(r2.getUuid());
            return nameCompared != 0 ? nameCompared : uuidCompared;
        });
    }
}
