# Networking Notes

## Show IP Address

```bash
ip a
hostname -I
```

## Routing Table

```bash
ip route
```

## DNS Lookup

```bash
nslookup google.com
```

Purpose:

* Verify DNS resolution
* Troubleshoot DNS issues

## Test Connectivity

```bash
ping 8.8.8.8
ping google.com
```

## Open Ports

```bash
ss -tuln
```

## Trace Network Path

```bash
traceroute google.com
```

Purpose:

* Shows every hop between your computer and destination

## Common Troubleshooting

### Internet not working

1. Check IP address

```bash
ip a
```

2. Check route

```bash
ip route
```

3. Test external IP

```bash
ping 8.8.8.8
```

4. Test DNS

```bash
nslookup google.com
```

