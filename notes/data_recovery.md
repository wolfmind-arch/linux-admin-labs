# Data Recovery Lab - NTFS Disk Recovery

## Objective

Recover data from an external 160 GB SSD that became unreadable after being connected to an Android TV.

---

## Symptoms

Linux was unable to mount the disk.

Mount attempt:

```bash
sudo mount /dev/sdb1 /mnt/recovery
```

Error:

```text
bad superblock
```

Windows was also unable to access the drive normally.

---

## Initial Investigation

### Display block devices

```bash
lsblk
```

Result:

```text
sdb
└─sdb1 160G
```

The disk and partition were still visible.

---

### Check partition table

```bash
sudo parted -l
```

Result:

```text
Disk /dev/sdb: 160GB
Partition Table: gpt

Partition:
sdb1 160GB ntfs
```

GPT partition table was intact.

---

### Check filesystem type

```bash
sudo blkid /dev/sdb1
```

Result:

```text
LABEL="Files_Ania"
TYPE="ntfs"
```

Linux detected a valid NTFS filesystem.

---

## NTFS Repair Attempt

Command:

```bash
sudo ntfsfix /dev/sdb1
```

Important errors:

```text
Record 0 has no FILE magic
Comparing $MFTMirr to $MFT... FAILED
$MFTMirr error: Invalid mft record for $MFT
```

### Diagnosis

Possible corruption of:

* MFT (Master File Table)
* MFT Mirror

Filesystem could not be mounted.

---

## Creating Disk Image

Available space check:

```bash
df -h
```

Ubuntu volume had approximately 331 GB free space.

Create image:

```bash
sudo ddrescue -d /dev/sdb Files_Ania.img Files_Ania.log
```

Purpose:

* Preserve original disk
* Perform recovery on image instead of physical drive

---

## Recovery Software

### DMDE

Downloaded Linux GUI version:

```text
dmde-4.4.4
```

Initial launch failed:

```text
libgdk-x11-2.0.so.0 missing
```

Installed missing dependencies and launched DMDE.

---

## Recovery Procedure

1. Open disk image:

```text
Files_Ania.img
```

2. Select detected NTFS volume:

```text
Files_Ania
160 GB
NTFS
```

3. Open Volume

Result:

DMDE successfully displayed directories:

```text
Pictures
Documents
Movies
Music
Downloads
Android
Harry Potter
```

This confirmed that data was still present.

---

## Data Copying

Recommended command:

```bash
rsync -ah --info=progress2 --ignore-existing source/ destination/
```

Benefits:

* Progress display
* Resume interrupted copies
* Skip already copied files
* Do not overwrite existing files

Example:

```bash
rsync -ah --info=progress2 --ignore-existing \
source/ \
~/Recovered_Data/
```

---

## Root Cause

Most likely:

* NTFS metadata corruption
* Damaged MFT / MFTMirr
* Triggered after use with Android TV

Not:

* Physical SSD failure
* GPT partition table corruption

---

## Lessons Learned

1. Never run CHKDSK immediately.
2. Create a disk image before recovery.
3. Work on the image whenever possible.
4. Use DMDE to verify file visibility.
5. Recover important files first:

   * Photos
   * Documents
   * Family videos
6. Use rsync for large recovery operations.

---

## Commands Used

```bash
lsblk
sudo parted -l
sudo blkid /dev/sdb1
sudo ntfsfix /dev/sdb1
df -h
sudo ddrescue -d /dev/sdb Files_Ania.img Files_Ania.log
rsync -ah --info=progress2 --ignore-existing
```

---

## Result

Successful recovery.

Disk detected.
Partition detected.
NTFS detected.
Files accessible through DMDE.
Data copied to internal storage.
