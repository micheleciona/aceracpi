ACPI Warning (nsaccess-0716): NsLookup: Type mismatch on DMAC (Device), searching for (BufferField) [20060512]
ACPI Warning (nsaccess-0716): NsLookup: Type mismatch on DMAC (Device), searching for (BufferField) [20060512]
/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20060512
 *
 * Disassembly of dsdt, Wed Jun 21 21:41:02 2006
 *
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00004741 (18241)
 *     Revision         0x01
 *     OEM ID           "ACER"
 *     OEM Table ID     "309B"
 *     OEM Revision     0x06040000 (100925440)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("dsdt.aml", "DSDT", 1, "ACER", "309B", 0x06040000)
{
    External (\_SB_.PCI0.LPC0.LNK6)
    External (\_SB_.PCI0.LPC0.LNK7)
    External (\_SB_.PCI0.LPC0.LNK5)
    External (\_SB_.PCI0.LPC0.LNK4)

    Name (Z000, 0x01)
    Name (Z001, 0x02)
    Name (Z002, 0x04)
    Name (Z003, 0x08)
    Name (Z004, 0x00)
    Name (Z005, 0x0F)
    Name (Z006, 0x0D)
    Name (Z007, 0x0B)
    Name (Z008, 0x09)
    OperationRegion (MNVT, SystemMemory, 0x1BEB9F64, 0x20)
    Field (MNVT, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        CMAP,   8, 
        CMBP,   8, 
        FDCP,   8, 
        LPTP,   8, 
        BTEN,   8, 
        THRT,   8, 
        BRAD,   8, 
        BGTL,   8, 
        CADL,   16, 
        CSTE,   16, 
        BGU1,   8, 
        BST1,   8
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00008010, 0x06) {}
    }

    Name (_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x04)
    {
        0x03, 
        0x03, 
        0x00, 
        0x00
    })
    Name (_S4, Package (0x04)
    {
        0x04, 
        0x04, 
        0x00, 
        0x00
    })
    Name (_S5, Package (0x04)
    {
        0x05, 
        0x05, 
        0x00, 
        0x00
    })
    OperationRegion (\DEBG, SystemIO, 0x1080, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBGP,   8
    }

    Name (HTTX, 0x00)
    Method (_PTS, 1, NotSerialized)
    {
        Store (0x50, DBGP)
        ShiftLeft (\_SB.PCI0.SMB.BLTH, 0x01, Local0)
        Or (\_SB.PCI0.SMB.WLAN, Local0, \_SB.PCI0.LPC0.PWRS)
        Store (0x00, \_SB.PCI0.SMB.WLAN)
        If (LEqual (Arg0, 0x04))
        {
            Store (0x54, DBGP)
            Store (0x01, \_SB.PCI0.SMB.BLTH)
            \_SB.PCI0.LPC0.PHSS (0x0E)
            Store (\_SB.PCI0.SMB.RVID, Local1)
            If (LGreaterEqual (Local1, 0x10))
            {
                Store (Zero, \_SB.PCI0.SMB.RSTU)
            }
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (0x53, DBGP)
            \_SB.PCI0.LPC0.EC0.CLCK (0x00)
            \_SB.PCI0.LPC0.PHSS (0x80)
        }

        If (LEqual (Arg0, 0x05))
        {
            Store (0x55, DBGP)
            Store (0x01, \_SB.PCI0.SMB.BLTH)
            Store (0x00, \_SB.PCI0.SMB.WLAN)
        }
    }

    Method (_WAK, 1, NotSerialized)
    {
        Store (0x30, DBGP)
        And (\_SB.PCI0.LPC0.PWRS, 0x01, Local0)
        Store (Local0, \_SB.PCI0.SMB.WLAN)
        And (\_SB.PCI0.LPC0.PWRS, 0x02, Local0)
        ShiftRight (Local0, 0x01, Local1)
        And (Local1, 0x01, Local1)
        Store (Local1, \_SB.PCI0.SMB.BLTH)
        If (\_SB.PCI0.SMB.EES0)
        {
            Store (0x01, \_SB.PCI0.SMB.GPO3)
        }
        Else
        {
            Store (0x00, \_SB.PCI0.SMB.GPO3)
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x34, DBGP)
            \_SB.PCI0.LPC0.PHSS (0x0F)
            Notify (\_SB.PWRB, 0x02)
        }

        Notify (\_PR.CPU0, 0x80)
        Store (0x36, DBGP)
    }

    Scope (\_SB)
    {
        Name (OSTB, Ones)
        OperationRegion (OSTY, SystemMemory, 0x1BEB9EF4, 0x00000001)
        Field (OSTY, AnyAcc, NoLock, Preserve)
        {
            TPOS,   8
        }

        Method (OSTP, 0, NotSerialized)
        {
            If (LEqual (^OSTB, Ones))
            {
                If (CondRefOf (\_OSI, Local0))
                {
                    If (\_OSI ("Windows 2001.1"))
                    {
                        Store (0x20, ^OSTB)
                        Store (0x20, ^TPOS)
                    }
                    Else
                    {
                        If (\_OSI ("Windows 2001 SP1"))
                        {
                            Store (0x10, ^OSTB)
                            Store (0x10, ^TPOS)
                        }
                        Else
                        {
                            If (\_OSI ("Windows 2001"))
                            {
                                Store (0x08, ^OSTB)
                                Store (0x08, ^TPOS)
                            }
                            Else
                            {
                                Store (0x00, ^OSTB)
                                Store (0x00, ^TPOS)
                            }
                        }
                    }
                }
                Else
                {
                    If (CondRefOf (\_OS, Local0))
                    {
                        If (^SEQL (\_OS, "Microsoft Windows"))
                        {
                            Store (0x01, ^OSTB)
                            Store (0x01, ^TPOS)
                        }
                        Else
                        {
                            If (^SEQL (\_OS, "Microsoft WindowsME: Millennium Edition"))
                            {
                                Store (0x02, ^OSTB)
                                Store (0x02, ^TPOS)
                            }
                            Else
                            {
                                If (^SEQL (\_OS, "Microsoft Windows NT"))
                                {
                                    Store (0x04, ^OSTB)
                                    Store (0x04, ^TPOS)
                                }
                                Else
                                {
                                    Store (0x00, ^OSTB)
                                    Store (0x00, ^TPOS)
                                }
                            }
                        }
                    }
                    Else
                    {
                        Store (0x00, ^OSTB)
                        Store (0x00, ^TPOS)
                    }
                }
            }

            Return (^OSTB)
        }

        Method (OSHT, 0, NotSerialized)
        {
            \_SB.OSTP ()
            Store (0x48, \_SB.PCI0.LPC0.BCMD)
            Store (Zero, \_SB.PCI0.LPC0.SMIC)
        }

        Method (SEQL, 2, Serialized)
        {
            Store (SizeOf (Arg0), Local0)
            Store (SizeOf (Arg1), Local1)
            If (LNotEqual (Local0, Local1))
            {
                Return (Zero)
            }

            Name (BUF0, Buffer (Local0) {})
            Store (Arg0, BUF0)
            Name (BUF1, Buffer (Local0) {})
            Store (Arg1, BUF1)
            Store (Zero, Local2)
            While (LLess (Local2, Local0))
            {
                Store (DerefOf (Index (BUF0, Local2)), Local3)
                Store (DerefOf (Index (BUF1, Local2)), Local4)
                If (LNotEqual (Local3, Local4))
                {
                    Return (Zero)
                }

                Increment (Local2)
            }

            Return (One)
        }
    }

    Name (\GPIC, 0x00)
    Method (\_PIC, 1, NotSerialized)
    {
        Store (Arg0, GPIC)
        If (Arg0)
        {
            \_SB.PCI0.LPC0.DSPI ()
        }
    }

    Scope (\_SB)
    {
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                If (\_SB.PCI0.SMB.LPOL)
                {
                    Return (0x00)
                }

                Return (0x01)
            }

            Name (_PRW, Package (0x02)
            {
                0x15, 
                0x03
            })
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A03"))
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)
            Method (_INI, 0, NotSerialized)
            {
                \_SB.OSTP ()
                If (\_SB.PCI0.SMB.EES0)
                {
                    Store (0x00, \_SB.PCI0.SMB.XET0)
                    Store (0x01, \_SB.PCI0.SMB.GPO3)
                }
                Else
                {
                    Store (0x01, \_SB.PCI0.SMB.XET0)
                    Store (0x00, \_SB.PCI0.SMB.GPO3)
                }
            }

            OperationRegion (NBRV, PCI_Config, 0x08, 0x01)
            Field (NBRV, ByteAcc, NoLock, Preserve)
            {
                PREV,   8
            }

            Method (NBR2, 0, NotSerialized)
            {
                If (And (PREV, 0xF0))
                {
                    Return (Ones)
                }
                Else
                {
                    Return (Zero)
                }
            }

            OperationRegion (NBMS, PCI_Config, 0x60, 0x08)
            Field (NBMS, DWordAcc, NoLock, Preserve)
            {
                MIDX,   32, 
                MIDR,   32
            }

            Mutex (NBMM, 0x00)
            Method (NBMR, 1, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Store (Local0, MIDX)
                Store (MIDR, Local0)
                Store (0x7F, MIDX)
                Release (NBMM)
                Return (Local0)
            }

            Method (NBMW, 2, NotSerialized)
            {
                Acquire (NBMM, 0xFFFF)
                And (Arg0, 0x7F, Local0)
                Or (Local0, 0x80, Local0)
                Store (Local0, MIDX)
                Store (Arg1, MIDR)
                Store (0x7F, MIDX)
                Release (NBMM)
            }

            OperationRegion (NBXP, PCI_Config, 0xE0, 0x08)
            Field (NBXP, DWordAcc, NoLock, Preserve)
            {
                NBXI,   32, 
                NBXD,   32
            }

            Mutex (NBXM, 0x00)
            Method (NBXR, 1, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (NBXD, Local0)
                Store (0x00, NBXI)
                Release (NBXM)
                Return (Local0)
            }

            Method (NBXW, 2, NotSerialized)
            {
                Acquire (NBXM, 0xFFFF)
                Store (Arg0, NBXI)
                Store (Arg1, NBXD)
                Store (0x00, NBXI)
                Release (NBXM)
            }

            Method (GFXM, 0, NotSerialized)
            {
                Store (NBMR (0x08), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (GPPM, 0, NotSerialized)
            {
                Store (NBMR (0x31), Local0)
                And (Local0, 0x0F, Local0)
                Return (Local0)
            }

            Method (XPTR, 2, NotSerialized)
            {
                If (LAnd (LLess (Arg0, 0x02), LGreater (Arg0, 0x07)))
                {
                    Return (0x00)
                }
                Else
                {
                    Store (0x01, Local0)
                    If (LLess (Arg0, 0x04))
                    {
                        Add (Arg0, 0x02, Local1)
                    }
                    Else
                    {
                        Add (Arg0, 0x11, Local1)
                    }

                    ShiftLeft (Local0, Local1, Local0)
                    Store (NBMR (0x08), Local2)
                    If (Arg1)
                    {
                        And (Local2, Not (Local0), Local2)
                    }
                    Else
                    {
                        Or (Local2, Local0, Local2)
                    }

                    NBMW (0x08, Local2)
                    Return (Ones)
                }
            }

            OperationRegion (K8ST, SystemMemory, 0x1BEB9F74, 0x00000048)
            Field (K8ST, AnyAcc, NoLock, Preserve)
            {
                C0_0,   16, 
                C2_0,   16, 
                C4_0,   16, 
                C6_0,   16, 
                C8_0,   16, 
                CA_0,   16, 
                CC_0,   16, 
                CE_0,   16, 
                D0_0,   16, 
                D2_0,   16, 
                D4_0,   16, 
                D6_0,   16, 
                D8_0,   16, 
                DA_0,   16, 
                DC_0,   16, 
                DE_0,   16, 
                E0_0,   16, 
                E2_0,   16, 
                E4_0,   16, 
                E6_0,   16, 
                E8_0,   16, 
                EA_0,   16, 
                EC_0,   16, 
                EE_0,   16, 
                F0_0,   16, 
                F2_0,   16, 
                F4_0,   16, 
                F6_0,   16, 
                F8_0,   16, 
                FA_0,   16, 
                FC_0,   16, 
                FE_0,   16, 
                TOML,   32, 
                TOMH,   32
            }

            Name (RSRC, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C2000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C6000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000C9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CA000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CE000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D2000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D6000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000D9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DA000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DE000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E1FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X10, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E2000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X11, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E5FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X12, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E6000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X13, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000E9FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X14, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EA000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X15, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EDFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X16, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EE000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00002000,         // Length
                    0x00,, _X17, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    0x00,, _X18, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    0x00,, , TypeStatic)
            })
            Method (_CRS, 0, Serialized)
            {
                CreateBitField (RSRC, \_SB.PCI0._X00._RW, C0RW)
                CreateDWordField (RSRC, \_SB.PCI0._X00._LEN, C0LN)
                Store (One, C0RW)
                Store (0x2000, C0LN)
                If (And (C0_0, 0x1818))
                {
                    Store (0x00, C0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X01._RW, C2RW)
                CreateDWordField (RSRC, \_SB.PCI0._X01._LEN, C2LN)
                Store (One, C2RW)
                Store (0x2000, C2LN)
                If (And (C2_0, 0x1818))
                {
                    Store (0x00, C2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X02._RW, C4RW)
                CreateDWordField (RSRC, \_SB.PCI0._X02._LEN, C4LN)
                Store (One, C4RW)
                Store (0x2000, C4LN)
                If (And (C4_0, 0x1818))
                {
                    Store (0x00, C4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X03._RW, C6RW)
                CreateDWordField (RSRC, \_SB.PCI0._X03._LEN, C6LN)
                Store (One, C6RW)
                Store (0x2000, C6LN)
                If (And (C6_0, 0x1818))
                {
                    Store (0x00, C6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X04._RW, C8RW)
                CreateDWordField (RSRC, \_SB.PCI0._X04._LEN, C8LN)
                Store (One, C8RW)
                Store (0x2000, C8LN)
                If (And (C8_0, 0x1818))
                {
                    Store (0x00, C8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X05._RW, CARW)
                CreateDWordField (RSRC, \_SB.PCI0._X05._LEN, CALN)
                Store (One, CARW)
                Store (0x2000, CALN)
                If (And (CA_0, 0x1818))
                {
                    Store (0x00, CALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X06._RW, CCRW)
                CreateDWordField (RSRC, \_SB.PCI0._X06._LEN, CCLN)
                Store (One, CCRW)
                Store (0x2000, CCLN)
                If (And (CC_0, 0x1818))
                {
                    Store (0x00, CCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X07._RW, CERW)
                CreateDWordField (RSRC, \_SB.PCI0._X07._LEN, CELN)
                Store (One, CERW)
                Store (0x2000, CELN)
                If (And (CE_0, 0x1818))
                {
                    Store (0x00, CELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X08._RW, D0RW)
                CreateDWordField (RSRC, \_SB.PCI0._X08._LEN, D0LN)
                Store (One, D0RW)
                Store (0x2000, D0LN)
                If (And (D0_0, 0x1818))
                {
                    Store (0x00, D0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X09._RW, D2RW)
                CreateDWordField (RSRC, \_SB.PCI0._X09._LEN, D2LN)
                Store (One, D2RW)
                Store (0x2000, D2LN)
                If (And (D2_0, 0x1818))
                {
                    Store (0x00, D2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X0A._RW, D4RW)
                CreateDWordField (RSRC, \_SB.PCI0._X0A._LEN, D4LN)
                Store (One, D4RW)
                Store (0x2000, D4LN)
                If (And (D4_0, 0x1818))
                {
                    Store (0x00, D4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X0B._RW, D6RW)
                CreateDWordField (RSRC, \_SB.PCI0._X0B._LEN, D6LN)
                Store (One, D6RW)
                Store (0x2000, D6LN)
                If (And (D6_0, 0x1818))
                {
                    Store (0x00, D6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X0C._RW, D8RW)
                CreateDWordField (RSRC, \_SB.PCI0._X0C._LEN, D8LN)
                Store (One, D8RW)
                Store (0x2000, D8LN)
                If (And (D8_0, 0x1818))
                {
                    Store (0x00, D8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X0D._RW, DARW)
                CreateDWordField (RSRC, \_SB.PCI0._X0D._LEN, DALN)
                Store (One, DARW)
                Store (0x2000, DALN)
                If (And (DA_0, 0x1818))
                {
                    Store (0x00, DALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X0E._RW, DCRW)
                CreateDWordField (RSRC, \_SB.PCI0._X0E._LEN, DCLN)
                Store (One, DCRW)
                Store (0x2000, DCLN)
                If (And (DC_0, 0x1818))
                {
                    Store (0x00, DCLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X0F._RW, DERW)
                CreateDWordField (RSRC, \_SB.PCI0._X0F._LEN, DELN)
                Store (One, DERW)
                Store (0x2000, DELN)
                If (And (DE_0, 0x1818))
                {
                    Store (0x00, DELN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X10._RW, E0RW)
                CreateDWordField (RSRC, \_SB.PCI0._X10._LEN, E0LN)
                Store (One, E0RW)
                Store (0x2000, E0LN)
                If (And (E0_0, 0x1818))
                {
                    Store (0x00, E0LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X11._RW, E2RW)
                CreateDWordField (RSRC, \_SB.PCI0._X11._LEN, E2LN)
                Store (One, E2RW)
                Store (0x2000, E2LN)
                If (And (E2_0, 0x1818))
                {
                    Store (0x00, E2LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X12._RW, E4RW)
                CreateDWordField (RSRC, \_SB.PCI0._X12._LEN, E4LN)
                Store (One, E4RW)
                Store (0x2000, E4LN)
                If (And (E4_0, 0x1818))
                {
                    Store (0x00, E4LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X13._RW, E6RW)
                CreateDWordField (RSRC, \_SB.PCI0._X13._LEN, E6LN)
                Store (One, E6RW)
                Store (0x2000, E6LN)
                If (And (E6_0, 0x1818))
                {
                    Store (0x00, E6LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X14._RW, E8RW)
                CreateDWordField (RSRC, \_SB.PCI0._X14._LEN, E8LN)
                Store (One, E8RW)
                Store (0x2000, E8LN)
                If (And (E8_0, 0x1818))
                {
                    Store (0x00, E8LN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X15._RW, EARW)
                CreateDWordField (RSRC, \_SB.PCI0._X15._LEN, EALN)
                Store (One, EARW)
                Store (0x2000, EALN)
                If (And (EA_0, 0x1818))
                {
                    Store (0x00, EALN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X16._RW, ECRW)
                CreateDWordField (RSRC, \_SB.PCI0._X16._LEN, ECLN)
                Store (One, ECRW)
                Store (0x2000, ECLN)
                If (And (EC_0, 0x1818))
                {
                    Store (0x00, ECLN)
                }

                CreateBitField (RSRC, \_SB.PCI0._X17._RW, EERW)
                CreateDWordField (RSRC, \_SB.PCI0._X17._LEN, EELN)
                Store (One, EERW)
                Store (0x2000, EELN)
                If (And (EE_0, 0x1818))
                {
                    Store (0x00, EELN)
                }

                CreateDWordField (RSRC, \_SB.PCI0._X18._MIN, BTMN)
                CreateDWordField (RSRC, \_SB.PCI0._X18._LEN, BTLN)
                Store (TOML, BTMN)
                Add (Not (BTMN), 0x01, BTLN)
                Return (RSRC)
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                Name (MEM2, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                })
                Method (_CRS, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (MEM1)
                    }

                    Return (MEM2)
                }
            }

            Method (_PRT, 0, NotSerialized)
            {
                If (GPIC)
                {
                    Return (Package (0x05)
                    {
                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }
                    })
                }
                Else
                {
                    Return (Package (0x05)
                    {
                        Package (0x04)
                        {
                            0x0013FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x00, 
                            \_SB.PCI0.LPC0.LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x01, 
                            \_SB.PCI0.LPC0.LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x02, 
                            \_SB.PCI0.LPC0.LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0014FFFF, 
                            0x03, 
                            \_SB.PCI0.LPC0.LNKD, 
                            0x00
                        }
                    })
                }
            }

            OperationRegion (BAR1, PCI_Config, 0x14, 0x04)
            Field (BAR1, ByteAcc, NoLock, Preserve)
            {
                Z009,   32
            }

            Device (OHC1)
            {
                Name (_ADR, 0x00130000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (OHC2)
            {
                Name (_ADR, 0x00130001)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (EHCI)
            {
                Name (_ADR, 0x00130002)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x03
                })
            }

            Device (SMB)
            {
                Name (_ADR, 0x00140000)
                OperationRegion (Z00A, PCI_Config, 0x08, 0x01)
                Field (Z00A, ByteAcc, NoLock, Preserve)
                {
                    RVID,   8
                }

                OperationRegion (GPIO, PCI_Config, 0x00, 0x0100)
                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x80), 
                        ,   3, 
                    GPE3,   1, 
                        ,   3, 
                    GPO3,   1, 
                            Offset (0xA8), 
                        ,   4, 
                    GPO8,   1
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                        ,   1, 
                    TM1E,   1, 
                    TM2E,   1, 
                            Offset (0x01), 
                        ,   1, 
                    TM1S,   1, 
                    TM2S,   1, 
                            Offset (0x04), 
                        ,   7, 
                    SLPS,   1, 
                            Offset (0x0D), 
                    EES0,   1, 
                            Offset (0x1C), 
                        ,   3, 
                    MKME,   1, 
                    PI3E,   1, 
                    PI2E,   1, 
                    PI1E,   1, 
                    PI0E,   1, 
                        ,   3, 
                    MKMS,   1, 
                    PI3S,   1, 
                    PI2S,   1, 
                    PI1S,   1, 
                    PI0S,   1, 
                            Offset (0x36), 
                        ,   6, 
                    GVT6,   1, 
                            Offset (0x37), 
                    XET0,   1, 
                        ,   3, 
                    GPX1,   1, 
                    LPOL,   1, 
                            Offset (0x38), 
                        ,   1, 
                    GPX4,   1, 
                    GPX5,   1, 
                        ,   1, 
                    GPX6,   1, 
                            Offset (0x3A), 
                        ,   5, 
                    LIDS,   1, 
                            Offset (0x3B), 
                            Offset (0x54), 
                        ,   1, 
                    PWSC,   1, 
                            Offset (0x55), 
                    SPRE,   1, 
                            Offset (0x65), 
                        ,   5, 
                    RSTU,   1, 
                            Offset (0x66), 
                        ,   5, 
                    USPD,   2, 
                            Offset (0x68), 
                        ,   3, 
                    TPDE,   1, 
                            Offset (0x90), 
                        ,   3, 
                    WLAN,   1, 
                        ,   2, 
                    BLTH,   1, 
                            Offset (0x92), 
                        ,   6, 
                    GE6I,   1
                }

                Method (TRMD, 0, NotSerialized)
                {
                    Store (Zero, SPRE)
                    Store (Zero, TPDE)
                }

                Method (HTCD, 0, NotSerialized)
                {
                    Store (Zero, PI2E)
                    Store (Zero, TM2E)
                    Store (PI2S, PI2S)
                    Store (TM2S, TM2S)
                }
            }

            Device (IDE)
            {
                Name (_ADR, 0x00140001)
                Name (UDMT, Package (0x08)
                {
                    0x78, 
                    0x5A, 
                    0x3C, 
                    0x2D, 
                    0x1E, 
                    0x14, 
                    0x0F, 
                    0x00
                })
                Name (PIOT, Package (0x06)
                {
                    0x0258, 
                    0x0186, 
                    0x010E, 
                    0xB4, 
                    0x78, 
                    0x00
                })
                Name (PITR, Package (0x06)
                {
                    0x99, 
                    0x47, 
                    0x34, 
                    0x22, 
                    0x20, 
                    0x99
                })
                Name (MDMT, Package (0x04)
                {
                    0x01E0, 
                    0x96, 
                    0x78, 
                    0x00
                })
                Name (MDTR, Package (0x04)
                {
                    0x77, 
                    0x21, 
                    0x20, 
                    0xFF
                })
                OperationRegion (IDE, PCI_Config, 0x40, 0x20)
                Field (IDE, WordAcc, NoLock, Preserve)
                {
                    PPIT,   16, 
                    SPIT,   16, 
                    PMDT,   16, 
                    SMDT,   16, 
                    PPIC,   8, 
                    SPIC,   8, 
                    PPIM,   8, 
                    SPIM,   8, 
                            Offset (0x14), 
                    PUDC,   2, 
                    SUDC,   2, 
                            Offset (0x16), 
                    PUDM,   8, 
                    SUDM,   8
                }

                Method (ATPI, 1, NotSerialized)
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local0)
                    Or (Local0, 0x41544900, Local0)
                    Store (Local0, \_SB.PCI0.LPC0.INFO)
                }

                Method (GETT, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F), Local0)
                    Store (ShiftRight (Arg0, 0x04), Local1)
                    Return (Multiply (0x1E, Add (Add (Local0, 0x01), Add (Local1, 
                        0x01))))
                }

                Method (GTM, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x00, PIT1)
                    CreateByteField (Arg0, 0x01, PIT0)
                    CreateByteField (Arg0, 0x02, MDT1)
                    CreateByteField (Arg0, 0x03, MDT0)
                    CreateByteField (Arg0, 0x04, PICX)
                    CreateByteField (Arg0, 0x05, UDCX)
                    CreateByteField (Arg0, 0x06, UDMX)
                    Name (BUF, Buffer (0x14)
                    {
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0x00, 0x00, 0x00, 0x00
                    })
                    CreateDWordField (BUF, 0x00, PIO0)
                    CreateDWordField (BUF, 0x04, DMA0)
                    CreateDWordField (BUF, 0x08, PIO1)
                    CreateDWordField (BUF, 0x0C, DMA1)
                    CreateDWordField (BUF, 0x10, FLAG)
                    If (And (PICX, 0x01))
                    {
                        Return (BUF)
                    }

                    Store (GETT (PIT0), PIO0)
                    Store (GETT (PIT1), PIO1)
                    If (And (UDCX, 0x01))
                    {
                        Or (FLAG, 0x01, FLAG)
                        Store (DerefOf (Index (^UDMT, And (UDMX, 0x0F))), DMA0)
                    }
                    Else
                    {
                        Store (GETT (MDT0), DMA0)
                    }

                    If (And (UDCX, 0x02))
                    {
                        Or (FLAG, 0x04, FLAG)
                        Store (DerefOf (Index (^UDMT, ShiftRight (UDMX, 0x04))), DMA1)
                    }
                    Else
                    {
                        Store (GETT (MDT1), DMA1)
                    }

                    Or (FLAG, 0x1A, FLAG)
                    Return (BUF)
                }

                Method (STM, 3, NotSerialized)
                {
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    Name (BUF, Buffer (0x07)
                    {
                        0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                    })
                    CreateByteField (BUF, 0x00, PIT1)
                    CreateByteField (BUF, 0x01, PIT0)
                    CreateByteField (BUF, 0x02, MDT1)
                    CreateByteField (BUF, 0x03, MDT0)
                    CreateByteField (BUF, 0x04, PIMX)
                    CreateByteField (BUF, 0x05, UDCX)
                    CreateByteField (BUF, 0x06, UDMX)
                    Store (Match (^PIOT, MLE, PIO0, MTR, 0x00, 0x00), Local0)
                    Divide (Local0, 0x05, Local0)
                    Store (Match (^PIOT, MLE, PIO1, MTR, 0x00, 0x00), Local1)
                    Divide (Local1, 0x05, Local1)
                    Store (Or (ShiftLeft (Local1, 0x04), Local0), PIMX)
                    Store (DerefOf (Index (^PITR, Local0)), PIT0)
                    Store (DerefOf (Index (^PITR, Local1)), PIT1)
                    If (And (FLAG, 0x01))
                    {
                        Store (Match (^UDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, Local0, UDMX)
                        Or (UDCX, 0x01, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA0, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA0, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        Store (Match (^UDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                        Divide (Local0, 0x07, Local0)
                        Or (UDMX, ShiftLeft (Local0, 0x04), UDMX)
                        Or (UDCX, 0x02, UDCX)
                    }
                    Else
                    {
                        If (LNotEqual (DMA1, 0xFFFFFFFF))
                        {
                            Store (Match (^MDMT, MLE, DMA1, MTR, 0x00, 0x00), Local0)
                            Store (DerefOf (Index (^MDTR, Local0)), MDT1)
                        }
                    }

                    Return (BUF)
                }

                Method (GTF, 2, NotSerialized)
                {
                    CreateByteField (Arg1, 0x00, MDT1)
                    CreateByteField (Arg1, 0x01, MDT0)
                    CreateByteField (Arg1, 0x02, PIMX)
                    CreateByteField (Arg1, 0x03, UDCX)
                    CreateByteField (Arg1, 0x04, UDMX)
                    If (LEqual (Arg0, 0xA0))
                    {
                        Store (And (PIMX, 0x0F), Local0)
                        Store (MDT0, Local1)
                        And (UDCX, 0x01, Local2)
                        Store (And (UDMX, 0x0F), Local3)
                    }
                    Else
                    {
                        Store (ShiftRight (PIMX, 0x04), Local0)
                        Store (MDT1, Local1)
                        And (UDCX, 0x02, Local2)
                        Store (ShiftRight (UDMX, 0x04), Local3)
                    }

                    Name (BUF, Buffer (0x0E)
                    {
                        0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF, 0x03, 
                        0x00, 0x00, 0x00, 0x00, 0xFF, 0xEF
                    })
                    CreateByteField (BUF, 0x01, PMOD)
                    CreateByteField (BUF, 0x08, DMOD)
                    CreateByteField (BUF, 0x05, CMDA)
                    CreateByteField (BUF, 0x0C, CMDB)
                    Store (Arg0, CMDA)
                    Store (Arg0, CMDB)
                    Or (Local0, 0x08, PMOD)
                    If (Local2)
                    {
                        Or (Local3, 0x40, DMOD)
                    }
                    Else
                    {
                        Store (Match (^MDMT, MLE, GETT (Local1), MTR, 0x00, 0x00), Local4)
                        If (LLess (Local4, 0x03))
                        {
                            Or (0x20, Local4, DMOD)
                        }
                    }

                    Return (BUF)
                }

                Device (PRID)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^PPIT, VPIT)
                        Store (^^PMDT, VMDT)
                        Store (^^PPIC, VPIC)
                        Store (^^PUDC, VUDC)
                        Store (^^PUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^PPIT)
                        Store (VMDT, ^^PMDT)
                        Store (VPIM, ^^PPIM)
                        Store (VUDC, ^^PUDC)
                        Store (VUDM, ^^PUDM)
                    }

                    Device (P_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (P_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^PMDT, VMDT)
                            Store (^^^PPIM, VPIM)
                            Store (^^^PUDC, VUDC)
                            Store (^^^PUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        And (PPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z006)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }

                    Name (FWSO, "FWSO")
                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }
                }

                Device (SECD)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIC)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (^^SPIT, VPIT)
                        Store (^^SMDT, VMDT)
                        Store (^^SPIC, VPIC)
                        Store (^^SUDC, VUDC)
                        Store (^^SUDM, VUDM)
                        Return (GTM (BUF))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Name (BUF, Buffer (0x07)
                        {
                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        })
                        CreateWordField (BUF, 0x00, VPIT)
                        CreateWordField (BUF, 0x02, VMDT)
                        CreateByteField (BUF, 0x04, VPIM)
                        CreateByteField (BUF, 0x05, VUDC)
                        CreateByteField (BUF, 0x06, VUDM)
                        Store (STM (Arg0, Arg1, Arg2), BUF)
                        Store (VPIT, ^^SPIT)
                        Store (VMDT, ^^SMDT)
                        Store (VPIM, ^^SPIM)
                        Store (VUDC, ^^SUDC)
                        Store (VUDM, ^^SUDM)
                    }

                    Device (S_D0)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xA0, BUF))
                        }
                    }

                    Device (S_D1)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Name (BUF, Buffer (0x05)
                            {
                                0x00, 0x00, 0x00, 0x00, 0x00
                            })
                            CreateWordField (BUF, 0x00, VMDT)
                            CreateByteField (BUF, 0x02, VPIM)
                            CreateByteField (BUF, 0x03, VUDC)
                            CreateByteField (BUF, 0x04, VUDM)
                            Store (^^^SMDT, VMDT)
                            Store (^^^SPIM, VPIM)
                            Store (^^^SUDC, VUDC)
                            Store (^^^SUDM, VUDM)
                            Return (GTF (0xB0, BUF))
                        }
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        And (SPIC, 0x01, Local0)
                        If (LAnd (Local0, 0x01))
                        {
                            Return (Z006)
                        }
                        Else
                        {
                            Return (Z005)
                        }
                    }
                }
            }

            Scope (\_GPE)
            {
                Method (_L07, 0, NotSerialized)
                {
                    \_SB.PCI0.IDE.SECD.INST ()
                    Sleep (0x07D0)
                    Notify (\_SB.PCI0.IDE.SECD, 0x01)
                }
            }

            Scope (\_SB.PCI0.IDE)
            {
                OperationRegion (TRST, PCI_Config, 0x64, 0x04)
                Field (TRST, AnyAcc, NoLock, Preserve)
                {
                        ,   3, 
                    STST,   1
                }

                OperationRegion (SSTS, SystemIO, 0x0177, 0x01)
                Field (SSTS, ByteAcc, NoLock, Preserve)
                {
                    P177,   8
                }

                OperationRegion (SCMD, SystemIO, 0x0376, 0x01)
                Field (SCMD, ByteAcc, NoLock, Preserve)
                {
                    P376,   8
                }

                OperationRegion (PMIO, SystemIO, 0x0CD6, 0x02)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    INPM,   8, 
                    DAPM,   8
                }

                IndexField (INPM, DAPM, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x36), 
                        ,   7, 
                    GV7P,   1, 
                            Offset (0x92), 
                        ,   7, 
                    GV7S,   1
                }
            }

            Scope (\_SB.PCI0.IDE.SECD)
            {
                Method (INST, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.SMB.GPE3, Zero))
                    {
                        If (LEqual (\_SB.PCI0.IDE.GV7S, Zero))
                        {
                            Store (0x11, DBGP)
                            Store (One, \_SB.PCI0.SMB.GPO3)
                            Store (0x00, STST)
                            Sleep (0x0BB8)
                            Store (0x88, \_SB.PCI0.LPC0.BCMD)
                            Store (Zero, \_SB.PCI0.LPC0.SMIC)
                            Store (0x00, Local2)
                            Store (0x00, Local0)
                            Store (Local0, Local1)
                            While (LAnd (LLess (Local2, 0x01F4), LNot (LOr (LEqual (Local0, 0x50), 
                                LEqual (Local0, 0x00)))))
                            {
                                Sleep (0x28)
                                Increment (Local2)
                                And (\_SB.PCI0.IDE.P177, 0xF0, Local0)
                            }

                            If (LGreaterEqual (Local2, 0x01F4))
                            {
                                \_SB.PCI0.IDE.SECD.S_D0._EJ0 (0x01)
                                \_SB.PCI0.IDE.SECD.S_D1._EJ0 (0x01)
                            }
                        }
                        Else
                        {
                            \_SB.PCI0.IDE.SECD.S_D0._EJ0 (0x01)
                            \_SB.PCI0.IDE.SECD.S_D1._EJ0 (0x01)
                        }

                        Notify (\_SB.PCI0.IDE.SECD, 0x01)
                    }
                }
            }

            Scope (\_SB.PCI0.IDE.SECD.S_D0)
            {
                Method (_EJ0, 1, NotSerialized)
                {
                    Store (0x22, DBGP)
                    Store (0x01, STST)
                    Store (0x04, P376)
                    Sleep (0x28)
                    Store (0x00, P376)
                    Sleep (0x28)
                    Store (Zero, \_SB.PCI0.SMB.GPO3)
                    Store (Zero, \_SB.PCI0.IDE.GV7P)
                    Sleep (0x28)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Store (STST, Local0)
                    If (Local0)
                    {
                        Return (0x00)
                    }

                    If (LEqual (\_SB.PCI0.IDE.GV7S, One))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Scope (\_SB.PCI0.IDE.SECD.S_D1)
            {
                Method (_EJ0, 1, NotSerialized)
                {
                    Store (0x01, STST)
                    Store (0x04, P376)
                    Sleep (0x28)
                    Store (0x00, P376)
                    Sleep (0x28)
                    Store (Zero, \_SB.PCI0.SMB.GPO3)
                    Store (Zero, \_SB.PCI0.IDE.GV7P)
                    Sleep (0x28)
                }

                Method (_STA, 0, NotSerialized)
                {
                    Store (STST, Local0)
                    If (Local0)
                    {
                        Return (0x00)
                    }

                    If (LEqual (\_SB.PCI0.IDE.GV7S, One))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                Mutex (PSMX, 0x00)
                OperationRegion (EXCO, SystemIO, 0x72, 0x02)
                Field (EXCO, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                            Offset (0xEC), 
                    BTWL,   2, 
                    BTLS,   1, 
                    STUP,   2, 
                    LANS,   1, 
                    SKUC,   1, 
                    BTHS,   1, 
                    PWRS,   2, 
                    BDID,   1, 
                            Offset (0xF0), 
                    Z00B,   1, 
                    Z00C,   2
                }

                OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
                Field (PIRQ, ByteAcc, NoLock, Preserve)
                {
                    PIID,   8, 
                    PIDA,   8
                }

                IndexField (PIID, PIDA, ByteAcc, NoLock, Preserve)
                {
                    PIRA,   8, 
                    PIRB,   8, 
                    PIRC,   8, 
                    PIRD,   8, 
                    PIRS,   8, 
                            Offset (0x09), 
                    PIRE,   8, 
                    PIRF,   8, 
                    PIRG,   8, 
                    PIRH,   8
                }

                Name (IPRS, ResourceTemplate ()
                {
                    IRQ (Level, ActiveLow, Shared, )
                        {10,11}
                })
                Method (DSPI, 0, NotSerialized)
                {
                    Store (0x00, PIRA)
                    Store (0x00, PIRB)
                    Store (0x00, PIRC)
                    Store (0x00, PIRD)
                    Store (0x09, PIRS)
                    Store (0x00, PIRE)
                    Store (0x00, PIRF)
                    Store (0x00, PIRG)
                    Store (0x00, PIRH)
                }

                Device (LNKA)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x01)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRA)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRA)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRA, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRA)
                    }
                }

                Device (LNKB)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x02)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRB)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRB)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRB, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRB)
                    }
                }

                Device (LNKC)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x03)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRC)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRC)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRC, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRC)
                    }
                }

                Device (LNKD)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x04)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRD)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRD)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRD, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRD)
                    }
                }

                Device (LNKE)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x05)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRD)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRE)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRE, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRE)
                    }
                }

                Device (LNKF)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x06)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRF)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRF)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRF, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRF)
                    }
                }

                Device (LNKG)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x07)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRG)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRG)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRG, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRG)
                    }
                }

                Device (LNKH)
                {
                    Name (_HID, EisaId ("PNP0C0F"))
                    Name (_UID, 0x08)
                    Method (_STA, 0, NotSerialized)
                    {
                        If (PIRH)
                        {
                            Return (Z007)
                        }
                        Else
                        {
                            Return (Z008)
                        }
                    }

                    Method (_PRS, 0, NotSerialized)
                    {
                        Return (IPRS)
                    }

                    Method (_DIS, 0, NotSerialized)
                    {
                        Store (0x00, PIRH)
                    }

                    Method (_CRS, 0, NotSerialized)
                    {
                        Store (IPRS, Local0)
                        CreateWordField (Local0, 0x01, IRQ0)
                        ShiftLeft (0x01, PIRH, IRQ0)
                        Return (Local0)
                    }

                    Method (_SRS, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x01, IRQ0)
                        FindSetRightBit (IRQ0, Local0)
                        Decrement (Local0)
                        Store (Local0, PIRH)
                    }
                }

                OperationRegion (LPCR, PCI_Config, 0x00, 0x7F)
                Field (LPCR, ByteAcc, NoLock, Preserve)
                {
                            Offset (0x44), 
                    LP0E,   6, 
                    CMA0,   1, 
                    CMA1,   1, 
                    CMA2,   1, 
                    CMA3,   1, 
                    CMA4,   1, 
                    CMA5,   1, 
                    CMA6,   1, 
                    CMA7,   1, 
                            Offset (0x48), 
                        ,   2, 
                    ENIO,   1, 
                            Offset (0x64), 
                    IOBS,   16, 
                            Offset (0x74), 
                    ALTW,   1, 
                            Offset (0x75)
                }

                OperationRegion (LCLM, SystemIO, 0x0C50, 0x03)
                Field (LCLM, ByteAcc, NoLock, Preserve)
                {
                    CLMI,   8, 
                    CLMD,   8, 
                    CLGP,   8
                }

                IndexField (CLMI, CLMD, ByteAcc, NoLock, Preserve)
                {
                    IDRG,   8, 
                            Offset (0x02), 
                    TSTS,   8, 
                    TINT,   8, 
                            Offset (0x12), 
                    I2CC,   8, 
                    GPIO,   8
                }

                Method (RGPM, 0, NotSerialized)
                {
                    Store (\_SB.PCI0.LPC0.GPIO, Local0)
                    And (Local0, Not (0xC0), Local0)
                    Store (Local0, \_SB.PCI0.LPC0.GPIO)
                    Store (\_SB.PCI0.LPC0.CLGP, Local1)
                    Return (Local1)
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {8}
                    })
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TIME)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {0}
                    })
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                    Name (_PRW, Package (0x02)
                    {
                        0x04, 
                        0x03
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Acquire (PSMX, 0xFFFF)
                        If (ECOK ())
                        {
                            Store (Arg0, \_SB.PCI0.LPC0.EC0.INKB)
                        }

                        Release (PSMX)
                    }
                }

                Device (MSE0)
                {
                    Name (_HID, EisaId ("PNP0F13"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Method (_PSW, 1, NotSerialized)
                    {
                        Acquire (PSMX, 0xFFFF)
                        If (ECOK ())
                        {
                            Store (Arg0, \_SB.PCI0.LPC0.EC0.TPAD)
                        }

                        Release (PSMX)
                    }
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x1080,             // Range Minimum
                            0x1080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x040B,             // Range Minimum
                            0x040B,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0870,             // Range Minimum
                            0x087F,             // Range Maximum
                            0x10,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD4,             // Range Minimum
                            0x0CD4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD6,             // Range Minimum
                            0x0CD6,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0CD8,             // Range Minimum
                            0x0CD8,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x8000,             // Range Minimum
                            0x8000,             // Range Maximum
                            0x01,               // Alignment
                            0x60,               // Length
                            )
                        WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                            0x0000,             // Granularity
                            0x8100,             // Range Minimum
                            0x81FF,             // Range Maximum
                            0x0000,             // Translation Offset
                            0x0100,             // Length
                            ,, , TypeStatic)
                        IO (Decode16,
                            0x0F40,             // Range Minimum
                            0x0F40,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IO (Decode16,
                            0x0280,             // Range Minimum
                            0x0280,             // Range Maximum
                            0x01,               // Alignment
                            0x14,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadOnly,
                            0xFFF80000,         // Address Base
                            0x00080000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x00000000,         // Address Base
                            0x00001000,         // Address Length
                            _X19)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        If (LGreaterEqual (TPOS, 0x04))
                        {
                            CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._X19._BAS, BARX)
                            Store (\_SB.PCI0.Z009, Local0)
                            And (Local0, 0xFFFFFFF0, BARX)
                        }

                        Return (MSRC)
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                OperationRegion (SMI0, SystemIO, 0x00000F40, 0x00000002)
                Field (SMI0, AnyAcc, NoLock, Preserve)
                {
                    SMIC,   8
                }

                OperationRegion (SMI1, SystemMemory, 0x1BEB9DD4, 0x00000120)
                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                    BCMD,   8, 
                    DID,    32, 
                    INFO,   1024
                }

                Field (SMI1, AnyAcc, NoLock, Preserve)
                {
                            AccessAs (ByteAcc, 0x00), 
                            Offset (0x05), 
                    INF,    8, 
                    INF1,   32
                }

                Method (PHSS, 1, NotSerialized)
                {
                    Acquire (PSMX, 0xFFFF)
                    Store (0xA0, BCMD)
                    Store (Arg0, DID)
                    Store (Zero, SMIC)
                    Release (PSMX)
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A05"))
                    Method (_INI, 0, NotSerialized)
                    {
                        Store (0x00, \_SB.PCI0.LPC0.LP0E)
                        Store (0x00, \_SB.PCI0.LPC0.CMA0)
                        Store (0x00, \_SB.PCI0.LPC0.CMA1)
                        Store (0x00, \_SB.PCI0.LPC0.CMA2)
                        Store (0x00, \_SB.PCI0.LPC0.CMA3)
                        Store (0x00, \_SB.PCI0.LPC0.CMA4)
                        Store (0x00, \_SB.PCI0.LPC0.CMA5)
                        Store (0x00, \_SB.PCI0.LPC0.CMA6)
                        Store (0x00, \_SB.PCI0.LPC0.CMA7)
                    }

                    OperationRegion (SIIO, SystemIO, 0x2E, 0x02)
                    Field (SIIO, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }

                    Mutex (S227, 0x00)
                    Method (ENTR, 0, NotSerialized)
                    {
                        Store (0x55, INDX)
                    }

                    Method (EXIT, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                    }

                    Method (RDRG, 1, NotSerialized)
                    {
                        ENTR ()
                        Store (Arg0, INDX)
                        Store (DATA, Local0)
                        EXIT ()
                        Return (Local0)
                    }

                    Method (WRRG, 2, NotSerialized)
                    {
                        ENTR ()
                        Store (Arg0, INDX)
                        Store (Arg1, DATA)
                        EXIT ()
                    }

                    Method (READ, 3, NotSerialized)
                    {
                        Acquire (S227, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (RDRG (Arg1), Local1)
                        }

                        And (Local1, Arg2, Local1)
                        Release (S227)
                        Return (Local1)
                    }

                    Method (WRIT, 3, NotSerialized)
                    {
                        Acquire (S227, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            WRRG (Arg1, Arg2)
                        }

                        Release (S227)
                    }

                    Device (FIR)
                    {
                        Name (_HID, EisaId ("SMCF020"))
                        Name (_CID, 0x1005D041)
                        Name (FENA, 0x01)
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _X1A)
                            IO (Decode16,
                                0x0228,             // Range Minimum
                                0x0228,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                _X1B)
                            IRQNoFlags (_X1C)
                                {3,4}
                            DMA (Compatibility, NotBusMaster, Transfer8, _X1D)
                                {1,3}
                        })
                        Name (RSRC, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x00,               // Alignment
                                0x00,               // Length
                                )
                            IRQNoFlags ()
                                {0}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {0}
                        })
                        Method (_STA, 0, NotSerialized)
                        {
                            If (LEqual (CMBP, 0x00))
                            {
                                Return (0x00)
                            }

                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0xFE))
                            {
                                Store (0x01, \_SB.PCI0.LPC0.CMA0)
                                Store (0x01, \_SB.PCI0.LPC0.CMA6)
                            }

                            If (LEqual (Local0, 0xBE))
                            {
                                Store (0x01, \_SB.PCI0.LPC0.CMA1)
                                Store (0x01, \_SB.PCI0.LPC0.CMA3)
                            }

                            If (LEqual (Local0, 0xBA))
                            {
                                Store (0x01, \_SB.PCI0.LPC0.CMA5)
                                Store (0x01, \_SB.PCI0.LPC0.CMA2)
                            }

                            If (LEqual (Local0, 0xFA))
                            {
                                Store (0x01, \_SB.PCI0.LPC0.CMA7)
                                Store (0x01, \_SB.PCI0.LPC0.CMA4)
                            }

                            If (FENA)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (0x0D)
                            }
                        }

                        Method (_SRS, 1, NotSerialized)
                        {
                            CreateByteField (Arg0, 0x02, IOLO)
                            CreateByteField (Arg0, 0x03, IOHI)
                            CreateByteField (Arg0, 0x0A, I2LO)
                            CreateByteField (Arg0, 0x0B, I2HI)
                            CreateByteField (Arg0, 0x11, IRQL)
                            CreateByteField (Arg0, 0x14, DMAC)
                            WRIT (0x00, 0x25, 0x00)
                            FindSetRightBit (IRQL, Local0)
                            Decrement (Local0)
                            Store (READ (0x00, 0x28, 0xF0), Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x28, Local0)
                            Store (IOLO, Local0)
                            ShiftRight (Local0, 0x02, Local0)
                            And (Local0, 0xFE, Local0)
                            Store (IOHI, Local1)
                            ShiftLeft (Local1, 0x06, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x25, Local0)
                            Store (I2LO, Local0)
                            ShiftRight (Local0, 0x03, Local0)
                            Store (I2HI, Local1)
                            ShiftLeft (Local1, 0x05, Local1)
                            Or (Local0, Local1, Local0)
                            WRIT (0x00, 0x2B, Local0)
                            FindSetRightBit (DMAC, Local0)
                            Decrement (Local0)
                            WRIT (0x00, 0x2C, Local0)
                            Store (READ (0x00, 0x0A, 0xFF), Local0)
                            Not (0xC0, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x40, Local0)
                            WRIT (0x00, 0x0A, Local0)
                            Store (READ (0x00, 0x0C, 0xFF), Local0)
                            Not (0x38, Local1)
                            And (Local0, Local1, Local0)
                            Or (Local0, 0x08, Local0)
                            WRIT (0x00, 0x0C, Local0)
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (0x00, 0x02, Local0)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                            Store (0x01, FENA)
                        }

                        Method (_CRS, 0, NotSerialized)
                        {
                            If (LNotEqual (_STA (), 0x0F))
                            {
                                Return (RSRC)
                            }

                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._X1A._MIN, IOLO)
                            CreateByteField (BUF0, 0x03, IOHI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._X1A._MAX, IORL)
                            CreateByteField (BUF0, 0x05, IORH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._X1B._MIN, I2LO)
                            CreateByteField (BUF0, 0x0B, I2HI)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._X1B._MAX, I2RL)
                            CreateByteField (BUF0, 0x0D, I2RH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._X1C._INT, IRQL)
                            CreateByteField (BUF0, 0x12, IRQH)
                            CreateByteField (BUF0, \_SB.PCI0.LPC0.SIO.FIR._X1D._DMA, DMAC)
                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            Store (Local0, Local1)
                            And (Local1, 0xC0, Local1)
                            ShiftRight (Local1, 0x06, Local1)
                            ShiftLeft (Local0, 0x02, Local0)
                            And (Local0, 0xFF, Local0)
                            Store (Local0, IOLO)
                            Store (Local1, IOHI)
                            Store (IOLO, IORL)
                            Store (IOHI, IORH)
                            Store (IOHI, Local0)
                            Store (IOLO, Local1)
                            If (LEqual (Local0, 0x02))
                            {
                                If (LEqual (Local1, 0xF8))
                                {
                                    Subtract (Local1, 0xD0, Local1)
                                    Store (Local1, I2LO)
                                    Store (Local1, I2RL)
                                }

                                If (LEqual (Local1, 0xE8))
                                {
                                    Subtract (Local1, 0xC0, Local1)
                                    Store (Local1, I2LO)
                                    Store (Local1, I2RL)
                                }
                            }

                            If (LEqual (Local0, 0x03))
                            {
                                If (LEqual (Local1, 0xF8))
                                {
                                    Subtract (Local1, 0xC0, Local1)
                                    Store (Local1, I2LO)
                                    Store (Local1, I2RL)
                                }

                                If (LEqual (Local1, 0xE8))
                                {
                                    Subtract (Local0, 0x01, Local0)
                                    Store (Local0, I2HI)
                                    Store (Local0, I2RH)
                                    Subtract (Local1, 0xB0, Local1)
                                    Store (Local1, I2LO)
                                    Store (Local1, I2RL)
                                }
                            }

                            Store (READ (0x00, 0x28, 0x0F), Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, IRQL)
                            Store (0x00, IRQH)
                            Store (READ (0x00, 0x2C, 0x0F), Local0)
                            Store (0x01, Local1)
                            ShiftLeft (Local1, Local0, DMAC)
                            Return (BUF0)
                        }

                        Name (_PRS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0228,             // Range Minimum
                                    0x0228,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0338,             // Range Minimum
                                    0x0338,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0238,             // Range Minimum
                                    0x0238,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x01)
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0220,             // Range Minimum
                                    0x0220,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3,4}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            EndDependentFn ()
                        })
                        Method (_DIS, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x25, 0xFF), Local0)
                            If (LEqual (Local0, 0xFE))
                            {
                                Store (0x00, \_SB.PCI0.LPC0.CMA0)
                                Store (0x00, \_SB.PCI0.LPC0.CMA6)
                            }

                            If (LEqual (Local0, 0xBE))
                            {
                                Store (0x00, \_SB.PCI0.LPC0.CMA1)
                                Store (0x00, \_SB.PCI0.LPC0.CMA3)
                            }

                            If (LEqual (Local0, 0xBA))
                            {
                                Store (0x00, \_SB.PCI0.LPC0.CMA5)
                                Store (0x00, \_SB.PCI0.LPC0.CMA2)
                            }

                            If (LEqual (Local0, 0xFA))
                            {
                                Store (0x00, \_SB.PCI0.LPC0.CMA7)
                                Store (0x00, \_SB.PCI0.LPC0.CMA4)
                            }

                            Store (0x00, FENA)
                        }

                        Method (_PS0, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Or (Local0, 0x80, Local0)
                            WRIT (0x00, 0x02, Local0)
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Not (0x20, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS1, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x07, 0xFF), Local0)
                            Or (Local0, 0x20, Local0)
                            WRIT (0x00, 0x07, Local0)
                        }

                        Method (_PS3, 0, NotSerialized)
                        {
                            Store (READ (0x00, 0x02, 0xFF), Local0)
                            Not (0x80, Local1)
                            And (Local0, Local1, Local0)
                            WRIT (0x00, 0x02, Local0)
                        }
                    }
                }

                Method (ECOK, 0, NotSerialized)
                {
                    Store (0xE02C, \_SB.PCI0.LPC0.IOBS)
                    Store (0x01, \_SB.PCI0.LPC0.ENIO)
                    If (LEqual (\_SB.PCI0.LPC0.EC0.Z00D, 0x01))
                    {
                        Return (0x01)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))
                    Name (_GPE, 0x10)
                    Name (Z00D, Zero)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Method (_REG, 2, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, Z00D)
                        }
                    }

                    OperationRegion (ERAM, EmbeddedControl, 0x00, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x60), 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SMD0,   256, 
                        BCNT,   8, 
                        SMAA,   8, 
                                Offset (0x90), 
                        CHGM,   16, 
                        CHGS,   16, 
                        CHGC,   16, 
                        CHGV,   16, 
                        CHGA,   16, 
                        BAL0,   1, 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                                Offset (0x9C), 
                        BEEP,   1, 
                        FAN1,   1, 
                        FAN2,   1, 
                        CRT,    1, 
                        EXFD,   1, 
                        PHDD,   1, 
                        SHDD,   1, 
                        FDD,    1, 
                        SBTN,   1, 
                        VIDO,   1, 
                        VOLD,   1, 
                        VOLU,   1, 
                        MUTE,   1, 
                        CONT,   1, 
                        BRGT,   1, 
                        HBTN,   1, 
                        S4S,    1, 
                        SKEY,   1, 
                        BKEY,   1, 
                            ,   1, 
                        LIDA,   1, 
                                Offset (0x9F), 
                            ,   6, 
                        SKU0,   1, 
                                Offset (0xA3), 
                        S1LD,   1, 
                        S3LD,   1, 
                        VGAQ,   1, 
                        PCMQ,   1, 
                        PCMR,   1, 
                        ADP,    1, 
                        SYS6,   1, 
                        SYS7,   1, 
                        PWAK,   1, 
                        MWAK,   1, 
                        LWAK,   1, 
                            ,   3, 
                        INKB,   1, 
                        TPAD,   1, 
                        TST0,   8, 
                        TST1,   8, 
                        THON,   8, 
                        THSD,   8, 
                        THEM,   8, 
                        TST5,   8, 
                        TST6,   8, 
                        TST7,   8, 
                                Offset (0xB0), 
                        CTMP,   8, 
                                Offset (0xB8), 
                        BTDT,   1, 
                        BTPW,   1, 
                        BTDS,   1, 
                        BTPS,   1, 
                        BTSW,   1, 
                                Offset (0xB9), 
                        BRTS,   8, 
                                Offset (0xBB), 
                        WLAT,   1, 
                        BTAT,   1, 
                        WLEX,   1, 
                        BTEX,   1, 
                        KLSW,   1, 
                                Offset (0xBD), 
                        CPUN,   8, 
                                Offset (0xC0), 
                            ,   4, 
                        BMF0,   3, 
                        BTY0,   1, 
                        BST0,   8, 
                        BRC0,   16, 
                        BSN0,   16, 
                        BPV0,   16, 
                        BDV0,   16, 
                        BDC0,   16, 
                        BFC0,   16, 
                        GAU0,   8, 
                        BSCY,   8, 
                        BPC0,   16, 
                        BAC0,   16, 
                        BAT0,   8, 
                        BTW0,   16, 
                        BDN0,   8, 
                                Offset (0xE0), 
                        BSC1,   16, 
                        BSC2,   16, 
                        BSC3,   16, 
                        BSC4,   16, 
                        BSTS,   16
                    }

                    Method (PCLK, 0, NotSerialized)
                    {
                        Store (PTVL, Local0)
                        If (LEqual (Local0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Not (Local0, Local0)
                            Add (Local0, 0x01, Local0)
                            And (Local0, 0x07, Local0)
                            Store (Local0, DUTY)
                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, THEN)
                            }
                            Else
                            {
                                Store (0x01, THEN)
                            }
                        }
                    }

                    Method (_Q1C, 0, NotSerialized)
                    {
                        If (\_SB.PCI0.LPC0.EC0.VIDO)
                        {
                            \_SB.PCI0.AGP.VGA.DSSW ()
                            Store (0x00, \_SB.PCI0.LPC0.EC0.VIDO)
                        }
                    }

                    Method (_Q1E, 0, NotSerialized)
                    {
                        \_SB.PCI0.LPC0.EC0.PCLK ()
                    }

                    Method (_Q22, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q25, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x81)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                    }

                    Method (_Q27, 0, NotSerialized)
                    {
                        Notify (\_TZ.THRM, 0x80)
                    }

                    Method (_Q37, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x00)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q38, 0, NotSerialized)
                    {
                        Notify (\_SB.PCI0.LPC0.ACAD, 0x01)
                        Sleep (0x03E8)
                        Notify (\_SB.PCI0.LPC0.BAT1, 0x80)
                        Notify (\_PR.CPU0, 0x80)
                    }

                    Method (_Q43, 0, NotSerialized)
                    {
                    }

                    OperationRegion (CCLK, SystemIO, 0x8010, 0x04)
                    Field (CCLK, DWordAcc, NoLock, Preserve)
                    {
                            ,   1, 
                        DUTY,   3, 
                        THEN,   1, 
                                Offset (0x01), 
                            ,   9, 
                        TSTS,   1
                    }

                    OperationRegion (ECRM, EmbeddedControl, 0x00, 0xFF)
                    Field (ECRM, ByteAcc, Lock, Preserve)
                    {
                                Offset (0x94), 
                        ERIB,   16, 
                        ERBD,   8, 
                                Offset (0xAC), 
                        SDTM,   8, 
                        FSSN,   4, 
                        FANU,   4, 
                        PTVL,   3, 
                            ,   4, 
                        TTHR,   1, 
                                Offset (0xBC), 
                        PJID,   8, 
                                Offset (0xBE), 
                                Offset (0xF9), 
                        RFRD,   8, 
                                Offset (0xFB)
                    }

                    Mutex (FAMX, 0x00)
                    Method (FANG, 1, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (ERBD, Local0)
                        Release (FAMX)
                        Return (Local0)
                    }

                    Method (FANW, 2, NotSerialized)
                    {
                        Acquire (FAMX, 0xFFFF)
                        Store (Arg0, ERIB)
                        Store (Arg1, ERBD)
                        Release (FAMX)
                        Return (Arg1)
                    }

                    Method (TUVR, 1, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (THRO, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Return (THEN)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x01))
                            {
                                Return (DUTY)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x02))
                                {
                                    Return (TTHR)
                                }
                                Else
                                {
                                    Return (0xFF)
                                }
                            }
                        }
                    }

                    Method (CLCK, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (0x00, THEN)
                        }
                        Else
                        {
                            Store (Arg0, DUTY)
                            Store (0x01, THEN)
                        }

                        Return (THEN)
                    }
                }

                Device (BAT1)
                {
                    Name (_HID, EisaId ("PNP0C0A"))
                    Name (_UID, 0x01)
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Name (PBIF, Package (0x0D)
                    {
                        0x01, 
                        0x0FA0, 
                        0x0FA0, 
                        0x01, 
                        0x39D0, 
                        0x0294, 
                        0xC6, 
                        0x0108, 
                        0x0EC4, 
                        "Primary ", 
                        "", 
                        "Lion", 
                        "ACER "
                    })
                    Name (PBST, Package (0x04)
                    {
                        0x01, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0x39D0
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            If (\_SB.PCI0.LPC0.EC0.BAL0)
                            {
                                Sleep (0x14)
                                Return (0x1F)
                            }
                            Else
                            {
                                Sleep (0x14)
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            Sleep (0x14)
                            Return (0x1F)
                        }
                    }

                    Method (_BIF, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Index (PBIF, 0x01))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BFC0, Index (PBIF, 0x02))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDV0, Index (PBIF, 0x04))
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BDC0, Local2)
                            Divide (Local2, 0x64, Local6, Local2)
                            Multiply (Local2, 0x05, Local3)
                            Store (Local3, Index (PBIF, 0x05))
                            Multiply (Local2, 0x03, Local4)
                            Store (Local4, Index (PBIF, 0x06))
                        }

                        Return (PBIF)
                    }

                    Method (_BST, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BST0, Local0)
                            And (Local0, 0x07, Local0)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.GAU0, Local2)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BPV0, Local3)
                            Sleep (0x14)
                            Store (\_SB.PCI0.LPC0.EC0.BFC0, Local1)
                            If (Local2)
                            {
                                Multiply (Local2, Local1, Local2)
                                Divide (Local2, 0x64, Local6, Local2)
                                If (Local6)
                                {
                                    Increment (Local2)
                                }
                            }

                            Store (\_SB.PCI0.LPC0.EC0.BAC0, Local1)
                            If (And (Local1, 0x8000, Local1))
                            {
                                Store (\_SB.PCI0.LPC0.EC0.BAC0, Local1)
                                Subtract (0xFFFF, Local1, Local1)
                            }
                            Else
                            {
                                Store (0x00, Local1)
                            }

                            Store (Local0, Index (PBST, 0x00))
                            Store (Local1, Index (PBST, 0x01))
                            Store (Local2, Index (PBST, 0x02))
                            Store (Local3, Index (PBST, 0x03))
                        }

                        Return (PBST)
                    }
                }

                Device (ACAD)
                {
                    Name (_HID, "ACPI0003")
                    Name (_PCL, Package (0x01)
                    {
                        \_SB
                    })
                    Method (_PSR, 0, NotSerialized)
                    {
                        If (ECOK ())
                        {
                            Return (\_SB.PCI0.LPC0.EC0.ADP)
                        }

                        Return (0x01)
                    }
                }
            }

            Device (P2P)
            {
                Name (_ADR, 0x00140004)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                0x00, 
                                0x15
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                0x00, 
                                0x14
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                0x00, 
                                0x17
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                0x00, 
                                0x16
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x05)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNK4, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0002FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNK5, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNK4, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0004FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNK7, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0006FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNK6, 
                                0x00
                            }
                        })
                    }
                }

                Device (V394)
                {
                    Name (_ADR, 0x00)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                }

                Device (MIN1)
                {
                    Name (_ADR, 0x00020000)
                    OperationRegion (MIDS, PCI_Config, 0x00, 0xC8)
                    Field (MIDS, DWordAcc, NoLock, Preserve)
                    {
                        MOID,   32, 
                                Offset (0xC4), 
                                Offset (0xC5), 
                        MPME,   1, 
                            ,   6, 
                        MPMS,   1
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        If (LEqual (MOID, 0xFFFFFFFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (CB1)
                {
                    Name (_ADR, 0x00040000)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Method (_S1D, 0, NotSerialized)
                    {
                        Return (0x01)
                    }

                    Method (_S3D, 0, NotSerialized)
                    {
                        Return (0x03)
                    }

                    Method (_S4D, 0, NotSerialized)
                    {
                        Return (0x03)
                    }
                }

                Device (ELAN)
                {
                    Name (_ADR, 0x00060000)
                    Name (_PRW, Package (0x02)
                    {
                        0x04, 
                        0x04
                    })
                }
            }

            Device (AUDO)
            {
                Name (_ADR, 0x00140005)
            }

            Device (MODM)
            {
                Name (_ADR, 0x00140006)
                Name (_PRW, Package (0x02)
                {
                    0x0C, 
                    0x03
                })
            }

            Device (AGP)
            {
                Name (_ADR, 0x00010000)
                Method (_PRT, 0, NotSerialized)
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x00, 
                                \_SB.PCI0.LPC0.LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x01, 
                                \_SB.PCI0.LPC0.LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x02, 
                                \_SB.PCI0.LPC0.LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0x0005FFFF, 
                                0x03, 
                                \_SB.PCI0.LPC0.LNKA, 
                                0x00
                            }
                        })
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, 0x00050000)
                    Name (SWIT, 0x01)
                    Name (CRTA, 0x01)
                    Name (LCDA, 0x01)
                    Name (TVAA, 0x01)
                    Name (VLDF, 0x01)
                    OperationRegion (VIDS, PCI_Config, 0x00, 0xC8)
                    Field (VIDS, DWordAcc, NoLock, Preserve)
                    {
                        VDID,   32
                    }

                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }

                    Name (_PSC, 0x00)
                    Method (_PS0, 0, NotSerialized)
                    {
                        Store (0x00, _PSC)
                    }

                    Method (_PS1, 0, NotSerialized)
                    {
                        Store (0x01, _PSC)
                    }

                    Method (_PS3, 0, NotSerialized)
                    {
                        Store (0x03, _PSC)
                    }

                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (And (Arg0, 0x03), SWIT)
                    }

                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x03)
                        {
                            0x00010100, 
                            0x00010110, 
                            0x0200
                        })
                    }

                    Device (CRT)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0100)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x02, Local0)
                            And (Local1, 0x02, Local1)
                            If (Local0)
                            {
                                Store (0x01, CRTA)
                            }
                            Else
                            {
                                Store (0x00, CRTA)
                            }

                            If (CRTA)
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (CRTA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (LCD)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0110)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x01, Local0)
                            And (Local1, 0x01, Local1)
                            If (Local0)
                            {
                                Store (0x01, LCDA)
                            }
                            Else
                            {
                                Store (0x00, LCDA)
                            }

                            If (LCDA)
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x01))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (LCDA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Device (TV)
                    {
                        Method (_ADR, 0, NotSerialized)
                        {
                            Return (0x0200)
                        }

                        Method (_DCS, 0, NotSerialized)
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local0, 0x04, Local0)
                            And (Local1, 0x04, Local1)
                            If (Local0)
                            {
                                Store (0x01, TVAA)
                            }
                            Else
                            {
                                Store (0x00, TVAA)
                            }

                            If (TVAA)
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x1F)
                                }
                                Else
                                {
                                    Return (0x1D)
                                }
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x04))
                                {
                                    Return (0x0F)
                                }
                                Else
                                {
                                    Return (0x0D)
                                }
                            }
                        }

                        Method (_DGS, 0, NotSerialized)
                        {
                            If (TVAA)
                            {
                                Return (0x01)
                            }
                            Else
                            {
                                Return (0x00)
                            }
                        }

                        Method (_DSS, 1, NotSerialized)
                        {
                        }
                    }

                    Method (DSSW, 0, NotSerialized)
                    {
                        If (LEqual (SWIT, 0x00))
                        {
                            \_SB.PCI0.LPC0.PHSS (0x0C)
                            Store (\_SB.PCI0.LPC0.INF, Local0)
                            Store (\_SB.PCI0.LPC0.INF1, Local1)
                            And (Local1, 0x07, Local1)
                            Store (\_SB.PCI0.LPC0.INF, Local2)
                            Store (\_SB.PCI0.LPC0.INF1, Local3)
                            And (Local3, 0x0800, Local3)
                            If (LGreater (Local1, 0x01))
                            {
                                And (Local0, Local1, VLDF)
                                And (VLDF, 0xFE, VLDF)
                            }

                            If (VLDF)
                            {
                                If (LEqual (Local0, 0x03))
                                {
                                    If (LEqual (Local1, 0x01))
                                    {
                                        STBL (0x02)
                                    }

                                    If (LEqual (Local1, 0x02))
                                    {
                                        STBL (0x03)
                                    }

                                    If (LEqual (Local1, 0x03))
                                    {
                                        STBL (0x01)
                                    }
                                }

                                If (LEqual (Local0, 0x05))
                                {
                                    If (LEqual (Local3, 0x0800))
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x05)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x01)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                }

                                If (LEqual (Local0, 0x07))
                                {
                                    If (LEqual (Local3, 0x0800))
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x02)
                                        }

                                        If (LEqual (Local1, 0x02))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x03))
                                        {
                                            STBL (0x05)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x03)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (Local1, 0x01))
                                        {
                                            STBL (0x02)
                                        }

                                        If (LEqual (Local1, 0x02))
                                        {
                                            STBL (0x04)
                                        }

                                        If (LEqual (Local1, 0x03))
                                        {
                                            STBL (0x01)
                                        }

                                        If (LEqual (Local1, 0x04))
                                        {
                                            STBL (0x03)
                                        }

                                        If (LEqual (Local1, 0x05))
                                        {
                                            STBL (0x01)
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0x01, VLDF)
                                STBL (0x01)
                            }
                        }
                        Else
                        {
                            If (LEqual (SWIT, 0x01))
                            {
                                \_SB.PCI0.LPC0.PHSS (0x01)
                            }
                        }
                    }

                    Method (STBL, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (One, CRTA)
                            Store (Zero, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (One, CRTA)
                            Store (One, LCDA)
                            Store (Zero, TVAA)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (Zero, CRTA)
                            Store (Zero, LCDA)
                            Store (One, TVAA)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (Zero, CRTA)
                            Store (One, LCDA)
                            Store (One, TVAA)
                        }

                        Notify (\_SB.PCI0.AGP.VGA, 0x80)
                    }
                }
            }
        }
    }

    Scope (\_GPE)
    {
        Method (_L04, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.P2P.ELAN, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.OHC1, 0x02)
            Notify (\_SB.PCI0.OHC2, 0x02)
            Notify (\_SB.PCI0.EHCI, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }

        Method (_L0C, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MODM, 0x02)
        }

        Method (_L15, 0, NotSerialized)
        {
            Not (\_SB.PCI0.SMB.LPOL, \_SB.PCI0.SMB.LPOL)
            Notify (\_SB.LID, 0x80)
        }
    }

    Scope (_TZ)
    {
        Name (DTMP, 0x0BBA)
        Name (DAC0, 0x0CA0)
        Name (DPSV, 0x0E08)
        Name (TBSE, 0x0AAC)
        Name (DCRT, 0x0E4E)
        ThermalZone (THRM)
        {
            Method (_TMP, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    Multiply (\_SB.PCI0.LPC0.EC0.CTMP, 0x0A, Local0)
                    Add (Local0, 0x0AAC, Local0)
                    Return (Local0)
                }

                Return (DTMP)
            }

            Method (_AC0, 0, NotSerialized)
            {
                Return (DAC0)
            }

            Method (_CRT, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    Multiply (\_SB.PCI0.LPC0.EC0.THSD, 0x0A, Local0)
                    Add (Local0, 0x0AAC, Local0)
                    Return (Local0)
                }

                Return (DCRT)
            }

            Method (_PSV, 0, NotSerialized)
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    Multiply (\_SB.PCI0.LPC0.EC0.THON, 0x0A, Local0)
                    Add (Local0, 0x0AAC, Local0)
                    Return (Local0)
                }

                Return (DPSV)
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Name (_TC1, 0x02)
            Name (_TC2, 0x05)
            Name (_TSP, 0x96)
        }
    }
}

